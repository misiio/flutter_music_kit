import 'package:music_kit_platform_interface/music_kit_platform_interface.dart';

export 'package:music_kit_platform_interface/music_kit_platform_interface.dart'
    show
        MusicAuthorizationStatus,
        MusicSubscription,
        MusicPlayerState,
        MusicPlayerQueue,
        MusicPlayerQueueEntry,
        MusicPlayerPlaybackStatus,
        MusicPlayerRepeatMode,
        MusicPlayerShuffleMode;

class MusicKit {
  factory MusicKit() {
    _singleton ??= MusicKit._();
    return _singleton!;
  }

  MusicKit._();

  static MusicKit? _singleton;

  static MusicKitPlatform get _platform {
    return MusicKitPlatform.instance;
  }

  Future<MusicAuthorizationStatus> requestAuthorizationStatus() =>
      _platform.requestAuthorizationStatus();

  Future<MusicAuthorizationStatus> get authorizationStatus =>
      _platform.authorizationStatus;

  Future<String> get developerToken => _platform.developerToken;

  Future<String> fetchUserToken(String developerToken) =>
      _platform.fetchUserToken(developerToken);

  Future<String> get currentCountryCode => _platform.currentCountryCode;

  Stream<MusicSubscription> get onSubscriptionUpdated =>
      _platform.onSubscriptionUpdated;

  // player
  Future<bool> get isPreparedToPlay => _platform.isPreparedToPlay;

  Future<double> get playbackTime => _platform.playbackTime;

  Future<MusicPlayerState> get musicPlayerState => _platform.musicPlayerState;

  Stream<MusicPlayerState> get onMusicPlayerStateChanged =>
      _platform.onMusicPlayerStateChanged;

  Future<void> beginSeekingBackward() => _platform.beginSeekingBackward();

  Future<void> beginSeekingForward() => _platform.beginSeekingForward();

  Future<void> endSeeking() => _platform.endSeeking();

  Future<void> pause() => _platform.pause();

  Future<void> play() => _platform.play();

  Future<void> prepareToPlay() => _platform.prepareToPlay();

  Future<void> restartCurrentEntry() => _platform.restartCurrentEntry();

  Future<void> skipToNextEntry() => _platform.skipToNextEntry();

  Future<void> skipToPreviousEntry() => _platform.skipToPreviousEntry();

  Future<void> stop() => _platform.stop();

  Future<void> setQueue(String type, {required ResourceObject item}) =>
      _platform.setQueue(
        type,
        item: item,
      );

  Future<void> setQueueWithItems(
    String type, {
    required List<ResourceObject> items,
    int? startingAt,
  }) =>
      _platform.setQueueWithItems(
        type,
        items: items,
        startingAt: startingAt,
      );

  Stream<MusicPlayerQueue> get onPlayerQueueChanged =>
      _platform.onPlayerQueueChanged;
}
