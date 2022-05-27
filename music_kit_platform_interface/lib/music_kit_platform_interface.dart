library music_kit_platform_interface;

import 'package:music_kit_platform_interface/method_channel/method_channel_music_kit.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'model/music_authorization_status.dart';
import 'model/music_subscription.dart';
import 'model/music_player.dart';
import 'model/music_player_queue.dart';

export 'model/music_authorization_status.dart';
export 'model/music_subscription.dart';
export 'model/music_player.dart';
export 'model/music_player_queue.dart';

typedef JSONObject = Map<String, dynamic>;

abstract class MusicKitPlatform extends PlatformInterface {
  MusicKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static MusicKitPlatform _instance = MethodChannelMusicKit();

  static MusicKitPlatform get instance => _instance;

  static set instance(MusicKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<MusicAuthorizationStatus> requestAuthorizationStatus() async {
    throw UnimplementedError(
        'requestAuthorizationStatus() has not been implemented.');
  }

  Future<MusicAuthorizationStatus> get authorizationStatus async {
    throw UnimplementedError(
        'get authorizationStatus has not been implemented.');
  }

  Future<String?> get developerToken async {
    throw UnimplementedError('get developerToken has not been implemented.');
  }

  Future<String> fetchUserToken(String developerToken) async {
    throw UnimplementedError('fetchUserToken() has not been implemented.');
  }

  Future<String> get currentCountryCode async {
    throw UnimplementedError(
        'get currentCountryCode has not been implemented.');
  }

  Stream<MusicSubscription> get onSubscriptionUpdated {
    throw UnimplementedError(
        'get onSubscriptionUpdated has not been implemented.');
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
    throw UnimplementedError(
        'get onMusicPlayerStateChanged has not been implemented.');
  }

  Future<void> beginSeekingBackward() async {
    throw UnimplementedError(
        'beginSeekingBackward() has not been implemented.');
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

  Future<void> setQueue(String kind,
      {JSONObject? item, List<JSONObject>? items, int? startingAt}) async {
    throw UnimplementedError('setQueue() has not been implemented.');
  }

  Stream<MusicPlayerQueue> get onPlayerQueueChanged {
    throw UnimplementedError(
        'get onPlayerQueueChanged has not been implemented.');
  }
}
