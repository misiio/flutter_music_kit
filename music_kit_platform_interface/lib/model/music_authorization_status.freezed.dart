// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'music_authorization_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MusicAuthorizationStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? musicUserToken) authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? musicUserToken)? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? musicUserToken)? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicAuthorizationStatusCopyWith<$Res> {
  factory $MusicAuthorizationStatusCopyWith(MusicAuthorizationStatus value,
          $Res Function(MusicAuthorizationStatus) then) =
      _$MusicAuthorizationStatusCopyWithImpl<$Res>;
}

/// @nodoc
class _$MusicAuthorizationStatusCopyWithImpl<$Res>
    implements $MusicAuthorizationStatusCopyWith<$Res> {
  _$MusicAuthorizationStatusCopyWithImpl(this._value, this._then);

  final MusicAuthorizationStatus _value;
  // ignore: unused_field
  final $Res Function(MusicAuthorizationStatus) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$MusicAuthorizationStatusCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'MusicAuthorizationStatus.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? musicUserToken) authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? musicUserToken)? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? musicUserToken)? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends MusicAuthorizationStatus {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$_AuthorizedCopyWith<$Res> {
  factory _$$_AuthorizedCopyWith(
          _$_Authorized value, $Res Function(_$_Authorized) then) =
      __$$_AuthorizedCopyWithImpl<$Res>;
  $Res call({String? musicUserToken});
}

/// @nodoc
class __$$_AuthorizedCopyWithImpl<$Res>
    extends _$MusicAuthorizationStatusCopyWithImpl<$Res>
    implements _$$_AuthorizedCopyWith<$Res> {
  __$$_AuthorizedCopyWithImpl(
      _$_Authorized _value, $Res Function(_$_Authorized) _then)
      : super(_value, (v) => _then(v as _$_Authorized));

  @override
  _$_Authorized get _value => super._value as _$_Authorized;

  @override
  $Res call({
    Object? musicUserToken = freezed,
  }) {
    return _then(_$_Authorized(
      musicUserToken == freezed
          ? _value.musicUserToken
          : musicUserToken // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Authorized extends _Authorized {
  const _$_Authorized(this.musicUserToken) : super._();

  @override
  final String? musicUserToken;

  @override
  String toString() {
    return 'MusicAuthorizationStatus.authorized(musicUserToken: $musicUserToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Authorized &&
            const DeepCollectionEquality()
                .equals(other.musicUserToken, musicUserToken));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(musicUserToken));

  @JsonKey(ignore: true)
  @override
  _$$_AuthorizedCopyWith<_$_Authorized> get copyWith =>
      __$$_AuthorizedCopyWithImpl<_$_Authorized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? musicUserToken) authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
  }) {
    return authorized(musicUserToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? musicUserToken)? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
  }) {
    return authorized?.call(musicUserToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? musicUserToken)? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(musicUserToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class _Authorized extends MusicAuthorizationStatus {
  const factory _Authorized(final String? musicUserToken) = _$_Authorized;
  const _Authorized._() : super._();

  String? get musicUserToken => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_AuthorizedCopyWith<_$_Authorized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeniedCopyWith<$Res> {
  factory _$$_DeniedCopyWith(_$_Denied value, $Res Function(_$_Denied) then) =
      __$$_DeniedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeniedCopyWithImpl<$Res>
    extends _$MusicAuthorizationStatusCopyWithImpl<$Res>
    implements _$$_DeniedCopyWith<$Res> {
  __$$_DeniedCopyWithImpl(_$_Denied _value, $Res Function(_$_Denied) _then)
      : super(_value, (v) => _then(v as _$_Denied));

  @override
  _$_Denied get _value => super._value as _$_Denied;
}

/// @nodoc

class _$_Denied extends _Denied {
  const _$_Denied() : super._();

  @override
  String toString() {
    return 'MusicAuthorizationStatus.denied()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Denied);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? musicUserToken) authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
  }) {
    return denied();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? musicUserToken)? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
  }) {
    return denied?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? musicUserToken)? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    required TResult orElse(),
  }) {
    if (denied != null) {
      return denied();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
  }) {
    return denied(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
  }) {
    return denied?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    required TResult orElse(),
  }) {
    if (denied != null) {
      return denied(this);
    }
    return orElse();
  }
}

abstract class _Denied extends MusicAuthorizationStatus {
  const factory _Denied() = _$_Denied;
  const _Denied._() : super._();
}

/// @nodoc
abstract class _$$_NotDeterminedCopyWith<$Res> {
  factory _$$_NotDeterminedCopyWith(
          _$_NotDetermined value, $Res Function(_$_NotDetermined) then) =
      __$$_NotDeterminedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NotDeterminedCopyWithImpl<$Res>
    extends _$MusicAuthorizationStatusCopyWithImpl<$Res>
    implements _$$_NotDeterminedCopyWith<$Res> {
  __$$_NotDeterminedCopyWithImpl(
      _$_NotDetermined _value, $Res Function(_$_NotDetermined) _then)
      : super(_value, (v) => _then(v as _$_NotDetermined));

  @override
  _$_NotDetermined get _value => super._value as _$_NotDetermined;
}

/// @nodoc

class _$_NotDetermined extends _NotDetermined {
  const _$_NotDetermined() : super._();

  @override
  String toString() {
    return 'MusicAuthorizationStatus.notDetermined()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NotDetermined);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? musicUserToken) authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
  }) {
    return notDetermined();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? musicUserToken)? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
  }) {
    return notDetermined?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? musicUserToken)? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    required TResult orElse(),
  }) {
    if (notDetermined != null) {
      return notDetermined();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
  }) {
    return notDetermined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
  }) {
    return notDetermined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    required TResult orElse(),
  }) {
    if (notDetermined != null) {
      return notDetermined(this);
    }
    return orElse();
  }
}

abstract class _NotDetermined extends MusicAuthorizationStatus {
  const factory _NotDetermined() = _$_NotDetermined;
  const _NotDetermined._() : super._();
}

/// @nodoc
abstract class _$$_RestrictedCopyWith<$Res> {
  factory _$$_RestrictedCopyWith(
          _$_Restricted value, $Res Function(_$_Restricted) then) =
      __$$_RestrictedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RestrictedCopyWithImpl<$Res>
    extends _$MusicAuthorizationStatusCopyWithImpl<$Res>
    implements _$$_RestrictedCopyWith<$Res> {
  __$$_RestrictedCopyWithImpl(
      _$_Restricted _value, $Res Function(_$_Restricted) _then)
      : super(_value, (v) => _then(v as _$_Restricted));

  @override
  _$_Restricted get _value => super._value as _$_Restricted;
}

/// @nodoc

class _$_Restricted extends _Restricted {
  const _$_Restricted() : super._();

  @override
  String toString() {
    return 'MusicAuthorizationStatus.restricted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Restricted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? musicUserToken) authorized,
    required TResult Function() denied,
    required TResult Function() notDetermined,
    required TResult Function() restricted,
  }) {
    return restricted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? musicUserToken)? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
  }) {
    return restricted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? musicUserToken)? authorized,
    TResult Function()? denied,
    TResult Function()? notDetermined,
    TResult Function()? restricted,
    required TResult orElse(),
  }) {
    if (restricted != null) {
      return restricted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Authorized value) authorized,
    required TResult Function(_Denied value) denied,
    required TResult Function(_NotDetermined value) notDetermined,
    required TResult Function(_Restricted value) restricted,
  }) {
    return restricted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
  }) {
    return restricted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Authorized value)? authorized,
    TResult Function(_Denied value)? denied,
    TResult Function(_NotDetermined value)? notDetermined,
    TResult Function(_Restricted value)? restricted,
    required TResult orElse(),
  }) {
    if (restricted != null) {
      return restricted(this);
    }
    return orElse();
  }
}

abstract class _Restricted extends MusicAuthorizationStatus {
  const factory _Restricted() = _$_Restricted;
  const _Restricted._() : super._();
}
