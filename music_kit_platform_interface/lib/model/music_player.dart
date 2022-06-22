typedef PlayParameters = Map<String, dynamic>;

abstract class MusicItem {
  String get id;
}

// Album,Playlist,Song,Station,Track,Queue.Entry.Item
abstract class PlayableMusicItem extends MusicItem {
  PlayParameters get playParameters;
}

///
class MusicPlayerState {
  num playbackRate;
  MusicPlayerPlaybackStatus playbackStatus;
  MusicPlayerRepeatMode repeatMode;
  MusicPlayerShuffleMode shuffleMode;

  MusicPlayerState({
    required this.playbackRate,
    required this.playbackStatus,
    required this.repeatMode,
    required this.shuffleMode,
  });

  static MusicPlayerState fromMap(Map<String, dynamic> json) {
    return MusicPlayerState(
      playbackRate: json['playbackRate'] as num,
      playbackStatus:
          MusicPlayerPlaybackStatus.values[json['playbackStatus'] as int],
      repeatMode: MusicPlayerRepeatMode.values[json['repeatMode'] as int],
      shuffleMode: MusicPlayerShuffleMode.values[json['shuffleMode'] as int],
    );
  }
}

enum MusicPlayerPlaybackStatus {
  stopped,
  playing,
  paused,
  interrupted,
  seekingBackward,
  seekingForward,
}

enum MusicPlayerRepeatMode {
  none,
  one,
  all,
}

enum MusicPlayerShuffleMode {
  off,
  songs,
}
