import 'package:freezed_annotation/freezed_annotation.dart';

part 'music_authorization_status.freezed.dart';

@freezed
class MusicAuthorizationStatus with _$MusicAuthorizationStatus {
  const MusicAuthorizationStatus._();
  const factory MusicAuthorizationStatus.initial() = _Initial;
  const factory MusicAuthorizationStatus.authorized() = _Authorized;
  const factory MusicAuthorizationStatus.denied() = _Denied;
  const factory MusicAuthorizationStatus.notDetermined() = _NotDetermined;
  const factory MusicAuthorizationStatus.restricted() = _Restricted;

  static MusicAuthorizationStatus fromRawValue(int rawValue) {
    switch (rawValue) {
      case 0:
        return const MusicAuthorizationStatus.authorized();
      case 1:
        return const MusicAuthorizationStatus.denied();
      case 2:
        return const MusicAuthorizationStatus.notDetermined();
      case 3:
        return const MusicAuthorizationStatus.restricted();
      default:
        return const MusicAuthorizationStatus.initial();
    }
  }
}
