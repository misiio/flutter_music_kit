package app.misi.music_kit

import android.annotation.SuppressLint
import android.util.Log
import app.misi.music_kit.util.Constant.LOG_TAG
import com.apple.android.music.playback.controller.MediaPlayerController
import com.apple.android.music.playback.model.MediaPlayerException
import com.apple.android.music.playback.model.PlayerMediaItem
import com.apple.android.music.playback.model.PlayerQueueItem
import io.flutter.plugin.common.EventChannel

class PlayerQueueStreamHandler(private val playerController: MediaPlayerController?) :
  EventChannel.StreamHandler {
  companion object {
    fun convertQueueItem(it: PlayerQueueItem): Map<String, Any?> {
      return mapOf(
        "id" to it.item.subscriptionStoreId,
        "item" to it.item.toJson(),
        "title" to it.item.title,
        "subtitle" to it.item.artistName,
      )
    }
  }

  private var eventSink: EventChannel.EventSink? = null
  private var entries: List<Map<String, Any?>> = listOf()
  private var currentEntry: Map<String, Any?>? = null

  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    eventSink = events
    playerController?.addListener(playerControllerListener)
  }

  override fun onCancel(arguments: Any?) {
    eventSink = null
    playerController?.removeListener(playerControllerListener)
  }

  private val playerControllerListener = object : MediaPlayerController.Listener {
    override fun onPlayerStateRestored(p0: MediaPlayerController) {
      Log.d(LOG_TAG, "Queue Handler onPlayerStateRestored()")
    }

    override fun onPlaybackStateChanged(p0: MediaPlayerController, p1: Int, p2: Int) {
      Log.d(LOG_TAG, "Queue Handler onPlaybackStateChanged() prevState: $p1 currentState: $p2")
    }

    override fun onPlaybackStateUpdated(p0: MediaPlayerController) {
      Log.d(LOG_TAG, "Queue Handler onPlaybackStateUpdated()")
    }

    override fun onBufferingStateChanged(p0: MediaPlayerController, p1: Boolean) {
      Log.d(LOG_TAG, "Queue Handler onBufferingStateChanged() buffering: $p1")
    }

    override fun onCurrentItemChanged(
      p0: MediaPlayerController,
      previousItem: PlayerQueueItem?,
      currentItem: PlayerQueueItem?
    ) {
      currentEntry = currentItem?.let { convertQueueItem(it) }
      Log.d(
        LOG_TAG,
        "Queue Handler onCurrentItemChanged() prevItem: ${previousItem?.playbackQueueId} currentItem: $currentEntry"
      )
      updateQueue()
    }

    override fun onItemEnded(p0: MediaPlayerController, p1: PlayerQueueItem, p2: Long) {
      Log.d(LOG_TAG, "Queue Handler onItemEnded() queueItem: ${p1.playbackQueueId} endPosition: $p2")
    }

    override fun onMetadataUpdated(p0: MediaPlayerController, p1: PlayerQueueItem) {
      Log.d(LOG_TAG, "Queue Handler onMetadataUpdated() queueItem: ${p1.playbackQueueId}")
    }

    override fun onPlaybackQueueChanged(
      p0: MediaPlayerController,
      playbackQueueItems: MutableList<PlayerQueueItem>
    ) {
      Log.d(LOG_TAG, "Queue Handler onPlaybackQueueChanged() numOfQueueItems: ${playbackQueueItems.size}")
      entries = playbackQueueItems.map {
        convertQueueItem(it)
      }.toList()
      updateQueue()
    }

    override fun onPlaybackQueueItemsAdded(p0: MediaPlayerController, p1: Int, p2: Int, p3: Int) {
      Log.d(
        LOG_TAG,
        "Queue Handler onPlaybackQueueItemsAdded() insertionType: $p1 containerType: $p2 itemType: $p3"
      )
    }

    override fun onPlaybackError(p0: MediaPlayerController, p1: MediaPlayerException) {
      Log.d(LOG_TAG, "Queue Handler onPlaybackError() error(${p1.errorCode}): ${p1.message}")
    }

    override fun onPlaybackRepeatModeChanged(p0: MediaPlayerController, p1: Int) {
      Log.d(LOG_TAG, "Queue Handler onPlaybackRepeatModeChanged() repeatMode: $p1")
    }

    override fun onPlaybackShuffleModeChanged(p0: MediaPlayerController, p1: Int) {
      Log.d(LOG_TAG, "Queue Handler onPlaybackShuffleModeChanged() shuffleMode: $p1")
    }
  }

  private fun updateQueue() {
    val queue = mapOf(
      "entries" to entries,
      "currentEntry" to currentEntry,
    )
    eventSink?.success(queue)
  }
}

@SuppressLint("SwitchIntDef")
fun PlayerMediaItem.toJson(): Map<String, Any?> {
  return mapOf(
    "id" to this.subscriptionStoreId,
    "type" to when (this.type) {
      1 -> "songs"
      else -> "unknown"
    },
    "attributes" to mapOf(
      "artistName" to this.artistName,
      "albumName" to this.albumTitle,
      "contentRating" to if (this.isExplicitContent) "explicit" else null,
      "durationInMillis" to this.duration,
      "name" to this.title,
      "trackNumber" to this.albumTrackNumber,
      "discNumber" to this.albumDiscNumber,
      "url" to this.url,
      "playParams" to if (this.isPlayableContent) mapOf<String, Any?>(
        "id" to this.subscriptionStoreId,
        "kind" to when (this.type) {
          1 -> "song"
          else -> "unknown"
        }
      ) else null
    )
  )
}