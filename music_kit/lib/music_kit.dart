import 'package:music_kit_platform_interface/music_kit_platform_interface.dart';

export 'package:music_kit_platform_interface/music_kit_platform_interface.dart'
    show MusicAuthorizationStatus;

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

  Future<MusicAuthorizationStatus> requestAuthorizationStatus() {
    return _platform.requestAuthorizationStatus();
  }

  Future<MusicAuthorizationStatus> get authorizationStatus {
    return _platform.authorizationStatus;
  }
}
