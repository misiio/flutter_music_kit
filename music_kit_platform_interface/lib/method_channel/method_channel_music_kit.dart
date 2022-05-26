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
  final currentEntryEventChannel =
      const EventChannel('plugins.misi.app/music_kit/current_entry');

  @visibleForTesting
  final musicSubcriptionEventChannel =
      const EventChannel('plugins.misi.app/music_kit/music_subscription');

  @override
  Future<MusicAuthorizationStatus> requestAuthorizationStatus() async {
    final resp = await methodChannel.invokeMethod('requestAuthorizationStatus');
    return MusicAuthorizationStatus.values[resp.toInt()];
  }

  @override
  Future<MusicAuthorizationStatus> get authorizationStatus async {
    final resp = await methodChannel.invokeMethod('authorizationStatus');
    return MusicAuthorizationStatus.values[resp.toInt()];
  }

  @override
  Future<String?> get developerToken =>
      methodChannel.invokeMethod<String>('developerToken');

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
}
