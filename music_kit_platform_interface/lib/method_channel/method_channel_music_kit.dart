import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:music_kit_platform_interface/music_kit_platform_interface.dart';

class MethodChannelMusicKit extends MusicKitPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('plugins.misi.app/music_kit');

  @visibleForTesting
  final playerStateEventChannel =
      const EventChannel('plugins.misi.app/music_kit/player_state');

  @visibleForTesting
  final playerQueueEventChannel =
      const EventChannel('plugins.misi.app/music_kit/player_queue');

  @visibleForTesting
  final musicSubcriptionEventChannel =
      const EventChannel('plugins.misi.app/music_kit/music_subscription');

  @override
  Future<MusicAuthorizationStatus> requestAuthorizationStatus() async {
    final resp = await methodChannel.invokeMethod('requestAuthorizationStatus');
    return MusicAuthorizationStatus.fromRawValue(resp.toInt());
  }

  @override
  Future<MusicAuthorizationStatus> get authorizationStatus async {
    final resp = await methodChannel.invokeMethod('authorizationStatus');
    return MusicAuthorizationStatus.fromRawValue(resp.toInt());
  }

  @override
  Future<String> get developerToken async {
    final resp = await methodChannel.invokeMethod<String>('developerToken');
    return resp ?? '';
  }

  @override
  Future<String> fetchUserToken(String developerToken) async {
    final resp =
        await methodChannel.invokeMethod('fetchUserToken', developerToken);
    return resp.toString();
  }

  @override
  Future<String> get currentCountryCode async {
    final resp = await methodChannel.invokeMethod<String>('currentCountryCode');
    return resp!;
  }

  Stream<MusicSubscription>? _onSubscriptionUpdated;

  @override
  Stream<MusicSubscription> get onSubscriptionUpdated {
    _onSubscriptionUpdated ??=
        musicSubcriptionEventChannel.receiveBroadcastStream().map(
      (event) {
        final json = event.cast<String, dynamic>();
        return MusicSubscription.fromMap(json);
      },
    );
    return _onSubscriptionUpdated!;
  }

  ///
  @override
  Future<bool> get isPreparedToPlay async {
    final resp = await methodChannel.invokeMethod<bool>('isPreparedToPlay');
    return resp ?? false;
  }

  @override
  Future<double> get playbackTime async {
    final resp = await methodChannel.invokeMethod<double>('playbackTime');
    return resp ?? 0;
  }

  @override
  Future<MusicPlayerState> get musicPlayerState async {
    final resp = await methodChannel
        .invokeMapMethod<String, dynamic>('musicPlayerState');
    return MusicPlayerState.fromMap(resp!);
  }

  Stream<MusicPlayerState>? _onMusicPlayerStateChanged;

  @override
  Stream<MusicPlayerState> get onMusicPlayerStateChanged {
    _onMusicPlayerStateChanged ??=
        playerStateEventChannel.receiveBroadcastStream().map(
      (event) {
        final json = event.cast<String, dynamic>();
        return MusicPlayerState.fromMap(json);
      },
    );
    return _onMusicPlayerStateChanged!;
  }

  @override
  Future<void> beginSeekingBackward() {
    return methodChannel.invokeMethod('beginSeekingBackward');
  }

  @override
  Future<void> beginSeekingForward() {
    return methodChannel.invokeMethod('beginSeekingForward');
  }

  @override
  Future<void> endSeeking() {
    return methodChannel.invokeMethod('endSeeking');
  }

  @override
  Future<void> pause() async {
    return methodChannel.invokeMethod('pause');
  }

  @override
  Future<void> play() async {
    return methodChannel.invokeMethod('play');
  }

  @override
  Future<void> prepareToPlay() async {
    return methodChannel.invokeMethod('prepareToPlay');
  }

  @override
  Future<void> restartCurrentEntry() async {
    return methodChannel.invokeMethod('restartCurrentEntry');
  }

  @override
  Future<void> skipToNextEntry() async {
    return methodChannel.invokeMethod('skipToNextEntry');
  }

  @override
  Future<void> skipToPreviousEntry() async {
    return methodChannel.invokeMethod('skipToPreviousEntry');
  }

  @override
  Future<void> stop() async {
    return methodChannel.invokeMethod('stop');
  }

  @override
  Future<void> setQueue(String kind,
      {JSONObject? item, List<JSONObject>? items, int? startingAt}) {
    return methodChannel.invokeMethod('setQueue', {
      'kind': kind,
      'item': item,
      'items': items,
      'startingAt': startingAt,
    });
  }

  Stream<MusicPlayerQueue>? _onPlayerQueueChanged;

  @override
  Stream<MusicPlayerQueue> get onPlayerQueueChanged {
    _onPlayerQueueChanged ??=
        playerQueueEventChannel.receiveBroadcastStream().map(
      (event) {
        final json = Map<String, Object?>.from(event);
        return MusicPlayerQueue.fromJson(json);
      },
    );
    return _onPlayerQueueChanged!;
  }
}
