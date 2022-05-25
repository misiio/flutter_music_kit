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

  @override
  Future<MusicAuthorizationStatus> requestAuthorizationStatus() async {
    final resp = await methodChannel.invokeMethod("requestAuthorizationStatus");
    return MusicAuthorizationStatus.values[resp.toInt()];
  }

  @override
  Future<MusicAuthorizationStatus> get authorizationStatus async {
    final resp = await methodChannel.invokeMethod("authorizationStatus");
    return MusicAuthorizationStatus.values[resp.toInt()];
  }
}
