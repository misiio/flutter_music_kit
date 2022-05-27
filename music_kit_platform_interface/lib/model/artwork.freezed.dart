// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'artwork.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Artwork _$ArtworkFromJson(Map<String, dynamic> json) {
  return _Artwork.fromJson(json);
}

/// @nodoc
mixin _$Artwork {
  String? get bgColor => throw _privateConstructorUsedError;
  num get height => throw _privateConstructorUsedError;
  String? get textColor1 => throw _privateConstructorUsedError;
  String? get textColor2 => throw _privateConstructorUsedError;
  String? get textColor3 => throw _privateConstructorUsedError;
  String? get textColor4 => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  num get width => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArtworkCopyWith<Artwork> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtworkCopyWith<$Res> {
  factory $ArtworkCopyWith(Artwork value, $Res Function(Artwork) then) =
      _$ArtworkCopyWithImpl<$Res>;
  $Res call(
      {String? bgColor,
      num height,
      String? textColor1,
      String? textColor2,
      String? textColor3,
      String? textColor4,
      String url,
      num width});
}

/// @nodoc
class _$ArtworkCopyWithImpl<$Res> implements $ArtworkCopyWith<$Res> {
  _$ArtworkCopyWithImpl(this._value, this._then);

  final Artwork _value;
  // ignore: unused_field
  final $Res Function(Artwork) _then;

  @override
  $Res call({
    Object? bgColor = freezed,
    Object? height = freezed,
    Object? textColor1 = freezed,
    Object? textColor2 = freezed,
    Object? textColor3 = freezed,
    Object? textColor4 = freezed,
    Object? url = freezed,
    Object? width = freezed,
  }) {
    return _then(_value.copyWith(
      bgColor: bgColor == freezed
          ? _value.bgColor
          : bgColor // ignore: cast_nullable_to_non_nullable
              as String?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as num,
      textColor1: textColor1 == freezed
          ? _value.textColor1
          : textColor1 // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor2: textColor2 == freezed
          ? _value.textColor2
          : textColor2 // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor3: textColor3 == freezed
          ? _value.textColor3
          : textColor3 // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor4: textColor4 == freezed
          ? _value.textColor4
          : textColor4 // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
abstract class _$$_ArtworkCopyWith<$Res> implements $ArtworkCopyWith<$Res> {
  factory _$$_ArtworkCopyWith(
          _$_Artwork value, $Res Function(_$_Artwork) then) =
      __$$_ArtworkCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? bgColor,
      num height,
      String? textColor1,
      String? textColor2,
      String? textColor3,
      String? textColor4,
      String url,
      num width});
}

/// @nodoc
class __$$_ArtworkCopyWithImpl<$Res> extends _$ArtworkCopyWithImpl<$Res>
    implements _$$_ArtworkCopyWith<$Res> {
  __$$_ArtworkCopyWithImpl(_$_Artwork _value, $Res Function(_$_Artwork) _then)
      : super(_value, (v) => _then(v as _$_Artwork));

  @override
  _$_Artwork get _value => super._value as _$_Artwork;

  @override
  $Res call({
    Object? bgColor = freezed,
    Object? height = freezed,
    Object? textColor1 = freezed,
    Object? textColor2 = freezed,
    Object? textColor3 = freezed,
    Object? textColor4 = freezed,
    Object? url = freezed,
    Object? width = freezed,
  }) {
    return _then(_$_Artwork(
      bgColor: bgColor == freezed
          ? _value.bgColor
          : bgColor // ignore: cast_nullable_to_non_nullable
              as String?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as num,
      textColor1: textColor1 == freezed
          ? _value.textColor1
          : textColor1 // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor2: textColor2 == freezed
          ? _value.textColor2
          : textColor2 // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor3: textColor3 == freezed
          ? _value.textColor3
          : textColor3 // ignore: cast_nullable_to_non_nullable
              as String?,
      textColor4: textColor4 == freezed
          ? _value.textColor4
          : textColor4 // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Artwork implements _Artwork {
  const _$_Artwork(
      {this.bgColor,
      required this.height,
      this.textColor1,
      this.textColor2,
      this.textColor3,
      this.textColor4,
      required this.url,
      required this.width});

  factory _$_Artwork.fromJson(Map<String, dynamic> json) =>
      _$$_ArtworkFromJson(json);

  @override
  final String? bgColor;
  @override
  final num height;
  @override
  final String? textColor1;
  @override
  final String? textColor2;
  @override
  final String? textColor3;
  @override
  final String? textColor4;
  @override
  final String url;
  @override
  final num width;

  @override
  String toString() {
    return 'Artwork(bgColor: $bgColor, height: $height, textColor1: $textColor1, textColor2: $textColor2, textColor3: $textColor3, textColor4: $textColor4, url: $url, width: $width)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Artwork &&
            const DeepCollectionEquality().equals(other.bgColor, bgColor) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality()
                .equals(other.textColor1, textColor1) &&
            const DeepCollectionEquality()
                .equals(other.textColor2, textColor2) &&
            const DeepCollectionEquality()
                .equals(other.textColor3, textColor3) &&
            const DeepCollectionEquality()
                .equals(other.textColor4, textColor4) &&
            const DeepCollectionEquality().equals(other.url, url) &&
            const DeepCollectionEquality().equals(other.width, width));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(bgColor),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(textColor1),
      const DeepCollectionEquality().hash(textColor2),
      const DeepCollectionEquality().hash(textColor3),
      const DeepCollectionEquality().hash(textColor4),
      const DeepCollectionEquality().hash(url),
      const DeepCollectionEquality().hash(width));

  @JsonKey(ignore: true)
  @override
  _$$_ArtworkCopyWith<_$_Artwork> get copyWith =>
      __$$_ArtworkCopyWithImpl<_$_Artwork>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ArtworkToJson(this);
  }
}

abstract class _Artwork implements Artwork {
  const factory _Artwork(
      {final String? bgColor,
      required final num height,
      final String? textColor1,
      final String? textColor2,
      final String? textColor3,
      final String? textColor4,
      required final String url,
      required final num width}) = _$_Artwork;

  factory _Artwork.fromJson(Map<String, dynamic> json) = _$_Artwork.fromJson;

  @override
  String? get bgColor => throw _privateConstructorUsedError;
  @override
  num get height => throw _privateConstructorUsedError;
  @override
  String? get textColor1 => throw _privateConstructorUsedError;
  @override
  String? get textColor2 => throw _privateConstructorUsedError;
  @override
  String? get textColor3 => throw _privateConstructorUsedError;
  @override
  String? get textColor4 => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  num get width => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ArtworkCopyWith<_$_Artwork> get copyWith =>
      throw _privateConstructorUsedError;
}
