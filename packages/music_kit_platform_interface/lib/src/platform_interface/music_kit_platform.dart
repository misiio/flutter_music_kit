import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../method_channel/method_channel_music_kit.dart';
import '../types/types.dart';

abstract class MusicKitPlatform extends PlatformInterface {
  MusicKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static MusicKitPlatform _instance = MethodChannelMusicKit();

  static MusicKitPlatform get instance => _instance;

  static set instance(MusicKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> initialize(String developerToken, {String? musicUserToken}) async {
    throw UnimplementedError('initialize() has not been implemented.');
  }

  Future<MusicAuthorizationStatus> requestAuthorizationStatus({String? startScreenMessage}) async {
    throw UnimplementedError('requestAuthorizationStatus() has not been implemented.');
  }

  Future<MusicAuthorizationStatus> get authorizationStatus async {
    throw UnimplementedError('get authorizationStatus has not been implemented.');
  }

  Future<String> requestDeveloperToken() async {
    throw UnimplementedError('get requestDeveloperToken() has not been implemented.');
  }

  Future<String> requestUserToken(String developerToken, {String? startScreenMessage}) async {
    throw UnimplementedError('requestUserToken() has not been implemented.');
  }

  Future<String> get currentCountryCode async {
    throw UnimplementedError('get currentCountryCode has not been implemented.');
  }

  Stream<MusicSubscription> get onSubscriptionUpdated {
    throw UnimplementedError('get onSubscriptionUpdated has not been implemented.');
  }

  ///
  Future<bool> get isPreparedToPlay async {
    throw UnimplementedError('get isPreparedToPlay has not been implemented.');
  }

  Future<double> get playbackTime async {
    throw UnimplementedError('get playbackTime has not been implemented.');
  }

  Future<MusicPlayerState> get musicPlayerState async {
    throw UnimplementedError('get musicPlayerState has not been implemented.');
  }

  Stream<MusicPlayerState> get onMusicPlayerStateChanged {
    throw UnimplementedError('get onMusicPlayerStateChanged has not been implemented.');
  }

  Future<void> beginSeekingBackward() async {
    throw UnimplementedError('beginSeekingBackward() has not been implemented.');
  }

  Future<void> beginSeekingForward() async {
    throw UnimplementedError('beginSeekingForward() has not been implemented.');
  }

  Future<void> endSeeking() async {
    throw UnimplementedError('endSeeking() has not been implemented.');
  }

  Future<void> pause() async {
    throw UnimplementedError('pause() has not been implemented.');
  }

  Future<void> play() async {
    throw UnimplementedError('play() has not been implemented.');
  }

  Future<void> prepareToPlay() async {
    throw UnimplementedError('prepareToPlay() has not been implemented.');
  }

  Future<void> restartCurrentEntry() async {
    throw UnimplementedError('restartCurrentEntry() has not been implemented.');
  }

  Future<void> skipToNextEntry() async {
    throw UnimplementedError('skipToNextEntry() has not been implemented.');
  }

  Future<void> skipToPreviousEntry() async {
    throw UnimplementedError('skipToPreviousEntry() has not been implemented.');
  }

  Future<void> stop() async {
    throw UnimplementedError('stop() has not been implemented.');
  }

  Future<void> setQueue(String type, {required ResourceObject item}) async {
    throw UnimplementedError('setQueue() has not been implemented.');
  }

  Future<void> setQueueWithItems(
    String type, {
    required List<ResourceObject> items,
    int? startingAt,
  }) async {
    throw UnimplementedError('setQueueWithItems() has not been implemented.');
  }

  Stream<MusicPlayerQueue> get onPlayerQueueChanged {
    throw UnimplementedError('get onPlayerQueueChanged has not been implemented.');
  }

  Future<MusicPlayerRepeatMode> get repeatMode async {
    throw UnimplementedError('get repeatMode has not been implemented.');
  }

  Future<void> setRepeatMode(MusicPlayerRepeatMode mode) async {
    throw UnimplementedError('setRepeatMode() has not been implemented.');
  }

  Future<MusicPlayerRepeatMode> toggleRepeatMode() async {
    throw UnimplementedError('toggleRepeatMode() has not been implemented.');
  }

  Future<MusicPlayerShuffleMode> get shuffleMode async {
    throw UnimplementedError('get shuffleMode has not been implemented.');
  }

  Future<void> setShuffleMode(MusicPlayerShuffleMode mode) async {
    throw UnimplementedError('setShuffleMode() has not been implemented.');
  }

  Future<MusicPlayerShuffleMode> toggleShuffleMode() async {
    throw UnimplementedError('toggleShuffleMode() has not been implemented.');
  }
}
