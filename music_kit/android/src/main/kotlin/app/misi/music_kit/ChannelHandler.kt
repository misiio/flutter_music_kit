package app.misi.music_kit

import androidx.annotation.Keep
import app.misi.music_kit.AuthActivityResultHandler.Companion.ERR_REQUEST_USER_TOKEN
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import java.lang.reflect.Method

class ChannelHandler(private val activityHelper: ActivityHelper): MethodCallHandler {
  companion object {
    const val METHOD_CHANNEL_NAME = "plugins.misi.app/music_kit"
    const val MUSIC_SUBSCRIPTION_EVENT_CHANNEL_NAME = "plugins.misi.app/music_kit/music_subscription"
    const val MUSIC_PLAYER_STATE_EVENT_CHANNEL_NAME = "plugins.misi.app/music_kit/player_state"
    const val MUSIC_PLAYER_QUEUE_EVENT_CHANNEL_NAME = "plugins.misi.app/music_kit/player_queue"
  }

  private var methodChannel: MethodChannel? = null
  private var developerToken: String? = null
  private var musicUserToken: String? = null

  fun startListening(messenger: BinaryMessenger) {
    if (methodChannel != null) {
      stopListening()
    }

    methodChannel = MethodChannel(messenger, METHOD_CHANNEL_NAME).apply {
      setMethodCallHandler(this@ChannelHandler)
    }
  }

  fun stopListening() {
    methodChannel?.setMethodCallHandler(null)
    methodChannel = null
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
  fun authorizationStatus(call: MethodCall, result: MethodChannel.Result) {
    result.success(0) // .authorized
  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun requestAuthorizationStatus(call: MethodCall, result: MethodChannel.Result) {
    result.success(0) //.authorized
  }


//  @Keep
//  @Suppress("unused", "UNUSED_PARAMETER")
//  fun developerToken(call: MethodCall, result: MethodChannel.Result) {
//
//  }

  @Keep
  @Suppress("unused", "UNUSED_PARAMETER")
  fun fetchUserToken(call: MethodCall, result: MethodChannel.Result) {
    val developerToken = call.argument<String>("developerToken")
    if (developerToken.isNullOrBlank()) {
      result.error(ERR_REQUEST_USER_TOKEN, null, null)
    } else {
      this.developerToken = developerToken
      activityHelper.showAuthActivity(result, developerToken) { token ->
        musicUserToken = token
      }
    }
  }
}