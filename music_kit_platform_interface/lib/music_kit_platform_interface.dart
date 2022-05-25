library music_kit_platform_interface;

import 'package:music_kit_platform_interface/method_channel/method_channel_music_kit.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'model/music_authorization_status.dart';

export 'model/music_authorization_status.dart';

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
}
