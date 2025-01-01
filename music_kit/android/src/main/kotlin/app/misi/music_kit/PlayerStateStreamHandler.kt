package app.misi.music_kit

import android.util.Log
import app.misi.music_kit.util.Constant.LOG_TAG
import com.apple.android.music.playback.controller.MediaPlayerController
import com.apple.android.music.playback.model.*
import io.flutter.plugin.common.EventChannel

class PlayerStateStreamHandler(private val playerController: MediaPlayerController?) :
  EventChannel.StreamHandler {
  private var eventSink: EventChannel.EventSink? = null

  @PlaybackState
  private var playbackState: Int = playerController?.playbackState ?: PlaybackState.STOPPED
  private var playbackRate: Double = (playerController?.playbackRate ?: 1.0).toString().toDouble()

  @PlaybackRepeatMode
  private var repeatMode = playerController?.repeatMode ?: PlaybackRepeatMode.REPEAT_MODE_OFF

  @PlaybackShuffleMode
  private var shuffleMode = playerController?.shuffleMode ?: PlaybackShuffleMode.SHUFFLE_MODE_OFF

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    eventSink = events
    playerController?.addListener(playerControllerListener)
    updatePlaybackState()
  }

  override fun onCancel(arguments: Any?) {
    eventSink = null
    playerController?.removeListener(playerControllerListener)
  }

  private val playerControllerListener = object : MediaPlayerController.Listener {
    override fun onPlayerStateRestored(p0: MediaPlayerController) {
      Log.d(LOG_TAG, "State Handler onPlayerStateRestored()")
    }

    override fun onPlaybackStateChanged(
      p0: MediaPlayerController,
      previousState: Int,
      currentState: Int
    ) {
      Log.d(
        LOG_TAG,
        "State Handler onPlaybackStateChanged() prevState: $previousState currentState: $currentState"
      )
      playbackState = currentState
      updatePlaybackState()
    }

    override fun onPlaybackStateUpdated(p0: MediaPlayerController) {
      Log.d(LOG_TAG, "State Handler onPlaybackStateUpdated()")
    }

    override fun onBufferingStateChanged(p0: MediaPlayerController, p1: Boolean) {
      Log.d(LOG_TAG, "State Handler onBufferingStateChanged() buffering: $p1")
      if (playerController?.playbackState != null) {
        playbackState = playerController.playbackState
        updatePlaybackState()
      }
    }

    override fun onCurrentItemChanged(
      p0: MediaPlayerController,
      previousItem: PlayerQueueItem?,
      currentItem: PlayerQueueItem?
    ) {
      Log.d(
        LOG_TAG,
        "State Handler onCurrentItemChanged() prevItem: ${previousItem?.playbackQueueId} currentItem: ${currentItem?.playbackQueueId}"
      )
      if (playerController?.playbackState != null) {
        playbackState = playerController.playbackState
        updatePlaybackState()
      }
    }

    override fun onItemEnded(p0: MediaPlayerController, p1: PlayerQueueItem, p2: Long) {
      Log.d(LOG_TAG, "State Handler onItemEnded() queueItem: ${p1.playbackQueueId} endPosition: $p2")
    }

    override fun onMetadataUpdated(p0: MediaPlayerController, p1: PlayerQueueItem) {
      Log.d(LOG_TAG, "State Handler onMetadataUpdated() queueItem: ${p1.playbackQueueId}")
    }

    override fun onPlaybackQueueChanged(
      p0: MediaPlayerController,
      p1: MutableList<PlayerQueueItem>
    ) {
      Log.d(LOG_TAG, "State Handler onPlaybackQueueChanged() numOfQueueItems: ${p1.size}")
    }

    override fun onPlaybackQueueItemsAdded(p0: MediaPlayerController, p1: Int, p2: Int, p3: Int) {
      Log.d(
        LOG_TAG,
        "State Handler onPlaybackQueueItemsAdded() insertionType: $p1 containerType: $p2 itemType: $p3"
      )
    }

    override fun onPlaybackError(p0: MediaPlayerController, p1: MediaPlayerException) {
      Log.d(LOG_TAG, "State Handler onPlaybackError() error(${p1.errorCode}): ${p1.message}")
    }

    override fun onPlaybackRepeatModeChanged(p0: MediaPlayerController, p1: Int) {
      Log.d(LOG_TAG, "State Handler onPlaybackRepeatModeChanged() repeatMode: $p1")
    }

    override fun onPlaybackShuffleModeChanged(p0: MediaPlayerController, p1: Int) {
      Log.d(LOG_TAG, "State Handler onPlaybackShuffleModeChanged() shuffleMode: $p1")
    }
  }

  private fun updatePlaybackState() {
    val state = mapOf<String, Any>(
      "playbackStatus" to playbackState,
      "playbackRate" to playbackRate,
      "repeatMode" to repeatMode,
      "shuffleMode" to shuffleMode,
    )
    eventSink?.success(state)
  }
}