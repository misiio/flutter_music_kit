package app.misi.music_kit

import android.content.Context
import android.util.Log
import androidx.annotation.Keep
import app.misi.music_kit.AuthActivityResultHandler.Companion.ERR_REQUEST_USER_TOKEN
import app.misi.music_kit.infrastructure.UserStorefrontRepository
import app.misi.music_kit.util.AppleMusicTokenProvider
import app.misi.music_kit.util.Constant.LOG_TAG
import com.apple.android.music.playback.controller.MediaPlayerController
import com.apple.android.music.playback.controller.MediaPlayerControllerFactory
import com.apple.android.music.playback.model.*
import com.apple.android.music.playback.queue.CatalogPlaybackQueueItemProvider
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import kotlinx.coroutines.*
import java.lang.reflect.Method

class ChannelHandler(
  private val applicationContext: Context,
  private val activityDispatcher: ActivityDispatcher
) : MethodCallHandler {
  companion object {
    const val METHOD_CHANNEL_NAME = "plugins.misi.app/music_kit"
    const val MUSIC_SUBSCRIPTION_EVENT_CHANNEL_NAME =
      "plugins.misi.app/music_kit/music_subscription"
    const val MUSIC_PLAYER_STATE_EVENT_CHANNEL_NAME = "plugins.misi.app/music_kit/player_state"
    const val MUSIC_PLAYER_QUEUE_EVENT_CHANNEL_NAME = "plugins.misi.app/music_kit/player_queue"

    const val PARAM_DEVELOPER_TOKEN_KEY = "developerToken"
    const val PARAM_MUSIC_USER_TOKEN_KEY = "musicUserToken"

    const val ERR_NOT_INITIALIZED = "ERR_NOT_INITIALIZED"
  }

  private var methodChannel: MethodChannel? = null
  private var playerStateEventChannel: EventChannel? = null
  private var playerQueueEventChannel: EventChannel? = null

  private lateinit var developerToken: String
  private var musicUserToken: String? = null
    set(value) {
      field = value
      createPlayerControllerIfSatisfied(value)
    }

  private var storefrontId: String? = null

  private var playerController: MediaPlayerController? = null

  private val coroutineScope = CoroutineScope(Dispatchers.IO)

  fun startListening(messenger: BinaryMessenger) {
    if (methodChannel != null
      || playerStateEventChannel != null
      || playerQueueEventChannel != null
    ) {
      stopListening()
    }

    methodChannel = MethodChannel(messenger, METHOD_CHANNEL_NAME).apply {
      setMethodCallHandler(this@ChannelHandler)
    }

    playerStateEventChannel = EventChannel(messenger, MUSIC_PLAYER_STATE_EVENT_CHANNEL_NAME)
    playerQueueEventChannel = EventChannel(messenger, MUSIC_PLAYER_QUEUE_EVENT_CHANNEL_NAME)

    if (playerController != null) {
      playerStateEventChannel?.setStreamHandler(PlayerStateStreamHandler(playerController))
      playerQueueEventChannel?.setStreamHandler(PlayerQueueStreamHandler(playerController))
    }
  }

  fun stopListening() {
    methodChannel?.setMethodCallHandler(null)
    methodChannel = null

    playerStateEventChannel?.setStreamHandler(null)
    playerStateEventChannel = null

    playerQueueEventChannel?.setStreamHandler(null)
    playerQueueEventChannel = null

    playerController?.release()
  }

  fun cleanUp() {
    coroutineScope.cancel()
  }

  private fun createPlayerControllerIfSatisfied(musicUserToken: String?) {
    if (playerController == null && !musicUserToken.isNullOrBlank()) {
      playerController = MediaPlayerControllerFactory.createLocalController(
        applicationContext,
        AppleMusicTokenProvider(developerToken, musicUserToken)
      )
      playerStateEventChannel?.setStreamHandler(PlayerStateStreamHandler(playerController))
      playerQueueEventChannel?.setStreamHandler(PlayerQueueStreamHandler(playerController))
    }
  }

  private val methodMap = HashMap<String, Method>()

  override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
    if (methodMap.isEmpty()) {
      fetchMethods()
    }

    val method = methodMap[call.method]
    if (null == method) {
      result.notImplemented()
      return
    }

    val args = arrayOfNulls<Any>(2)
    args[0] = call
    args[1] = result

    try {
      method.invoke(this, *args)
    } catch (e: Exception) {
      result.error(call.method, e.message, e)
    }
  }

  private fun fetchMethods() {
    val c = this::class.java
    val m = c.declaredMethods

    for (method in m) {
      methodMap[method.name] = method
    }
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun initialize(call: MethodCall, result: MethodChannel.Result) {
    developerToken = call.argument<String>(PARAM_DEVELOPER_TOKEN_KEY)!!
    musicUserToken = call.argument<String>(PARAM_MUSIC_USER_TOKEN_KEY)

    Log.d(LOG_TAG, "initialize() developerToken: ${developerToken.length} musicUserToken: ${musicUserToken?.length ?: 0}")

    result.success(null)
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun authorizationStatus(call: MethodCall, result: MethodChannel.Result) {
    if (!musicUserToken.isNullOrBlank()) {
      result.success(
        mapOf(
          "status" to 0,
          "musicUserToken" to musicUserToken,
        )
      ) //.authorized
    } else {
      result.success(mapOf("status" to 2)) // .notDetermined
    }
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun requestAuthorizationStatus(call: MethodCall, result: MethodChannel.Result) {
    if (!musicUserToken.isNullOrBlank()) {
      result.success(
        mapOf(
          "status" to 0,
          "musicUserToken" to musicUserToken,
        )
      ) //.authorized
      return
    }

    if (!this::developerToken.isInitialized) {
      result.error(
        ERR_NOT_INITIALIZED,
        "Must call initialize() before using MusicKit in Android",
        mapOf("developerToken" to developerToken, "musicUserToken" to musicUserToken)
      )
      return
    }

    activityDispatcher.showAuthActivity(developerToken) { token, error ->
      if (error != null) {
        result.error(ERR_REQUEST_USER_TOKEN, error.toString(), null)
      } else {
        musicUserToken = token
        result.success(
          mapOf(
            "status" to 0,
            "musicUserToken" to token,
          )
        )
      }
    }
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun requestDeveloperToken(call: MethodCall, result: MethodChannel.Result) {
    result.success(developerToken)
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun requestUserToken(call: MethodCall, result: MethodChannel.Result) {
    if (!musicUserToken.isNullOrBlank()) {
      result.success(musicUserToken)
      return
    }

    val developerToken = call.argument<String>("developerToken")
    if (developerToken.isNullOrBlank()) {
      result.error(ERR_REQUEST_USER_TOKEN, null, null)
      return
    }

    this.developerToken = developerToken
    activityDispatcher.showAuthActivity(developerToken) { token, error ->
      if (error != null) {
        result.error(ERR_REQUEST_USER_TOKEN, error.toString(), null)
      } else {
        musicUserToken = token
        result.success(token)
      }
    }
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun currentCountryCode(call: MethodCall, result: MethodChannel.Result) {
    if (!storefrontId.isNullOrBlank()) {
      result.success(storefrontId!!)
      return
    }

    if (musicUserToken.isNullOrBlank()) {
      result.error("ERROR_FETCHING_STOREFRONT", "No valid musicUserToken provided", null)
      return
    }

    val storefrontRepo = UserStorefrontRepository()

    coroutineScope.launch {
      val response = storefrontRepo.getStorefrontId(developerToken, musicUserToken!!)
      response.fold(
        {
          storefrontId = it
          result.success(storefrontId)
        },
        { result.error("ERROR_FETCHING_STOREFRONT", it.message, null) }
      )
    }
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun isPreparedToPlay(call: MethodCall, result: MethodChannel.Result) {
    result.notImplemented()
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun playbackTime(call: MethodCall, result: MethodChannel.Result) {
    result.notImplemented()
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun musicPlayerState(call: MethodCall, result: MethodChannel.Result) {
    val state = mapOf<String, Any>(
      "playbackStatus" to (playerController?.playbackState ?: PlaybackState.STOPPED),
      "playbackRate" to ((playerController?.playbackRate ?: 1.0).toString().toDouble()),
      "repeatMode" to (playerController?.repeatMode ?: PlaybackRepeatMode.REPEAT_MODE_OFF),
      "shuffleMode" to (playerController?.shuffleMode ?: PlaybackShuffleMode.SHUFFLE_MODE_OFF),
    )
    result.success(state)
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun pause(call: MethodCall, result: MethodChannel.Result) {
    playerController?.pause()
    result.success(null)
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun play(call: MethodCall, result: MethodChannel.Result) {
    playerController?.play()
    result.success(null)
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun prepareToPlay(call: MethodCall, result: MethodChannel.Result) {
    result.notImplemented()
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun restartCurrentEntry(call: MethodCall, result: MethodChannel.Result) {
    result.notImplemented()
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun skipToNextEntry(call: MethodCall, result: MethodChannel.Result) {
    if (playerController?.canSkipToNextItem() == true) {
      playerController?.skipToNextItem()
      result.success(null)
    } else {
      result.error("ERR_SKIP_TO_NEXT", null, null)
    }
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun skipToPreviousEntry(call: MethodCall, result: MethodChannel.Result) {
    if (playerController?.canSkipToPreviousItem() == true) {
      playerController?.skipToPreviousItem()
      result.success(null)
    } else {
      result.error("ERR_SKIP_TO_PREVIOUS", null, null)
    }
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun stop(call: MethodCall, result: MethodChannel.Result) {
    playerController?.stop()
    result.success(null)
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun setQueue(call: MethodCall, result: MethodChannel.Result) {
    val itemType = call.argument<String>("type")
    val itemObject = call.argument<Map<String, Any>>("item")
    val queueProviderBuilder = CatalogPlaybackQueueItemProvider.Builder()
    val containerType: Int = when (itemType) {
      "albums" -> MediaContainerType.ALBUM
      "playlists" -> MediaContainerType.PLAYLIST
      else -> MediaContainerType.NONE
    }
    val id = itemObject?.get("id") as String
    queueProviderBuilder.containers(containerType, id)
    playerController?.prepare(queueProviderBuilder.build(), true)
    result.success(null)
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun setQueueWithItems(call: MethodCall, result: MethodChannel.Result) {
    val itemType = call.argument<String>("type")
    val itemObjects = call.argument<List<Map<String, Any>>>("items")
    val startingAt = call.argument<Int>("startingAt")
    val queueProviderBuilder = CatalogPlaybackQueueItemProvider.Builder()
    val mediaItemType = when (itemType) {
      "songs", "tracks" -> MediaItemType.SONG
      else -> MediaItemType.UNKNOWN
    }
    val ids = itemObjects!!.map {
      it["id"] as String
    }.toTypedArray()
    queueProviderBuilder.items(mediaItemType, *ids)
    if (startingAt != null) {
      queueProviderBuilder.startItemIndex(startingAt)
    }
    playerController?.prepare(queueProviderBuilder.build(), true)
    result.success(null)
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun setRepeatMode(call: MethodCall, result: MethodChannel.Result) {
    if (playerController?.canSetRepeatMode() == true) {
      val mode = call.arguments as Int
      playerController?.repeatMode = mode
    }
    result.success(null)
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun setShuffleMode(call: MethodCall, result: MethodChannel.Result) {
    if (playerController?.canSetShuffleMode() == true) {
      val mode = call.arguments as Int
      playerController?.shuffleMode = mode
    }
    result.success(null)
  }
}