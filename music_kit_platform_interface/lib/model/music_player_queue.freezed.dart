// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'music_player_queue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MusicPlayerQueueEntry _$MusicPlayerQueueEntryFromJson(
    Map<String, dynamic> json) {
  return _MusicPlayerQueueEntry.fromJson(json);
}

/// @nodoc
mixin _$MusicPlayerQueueEntry {
  Artwork? get artwork => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Map<String, dynamic>? get item => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicPlayerQueueEntryCopyWith<MusicPlayerQueueEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicPlayerQueueEntryCopyWith<$Res> {
  factory $MusicPlayerQueueEntryCopyWith(MusicPlayerQueueEntry value,
          $Res Function(MusicPlayerQueueEntry) then) =
      _$MusicPlayerQueueEntryCopyWithImpl<$Res>;
  $Res call(
      {Artwork? artwork,
      String id,
      Map<String, dynamic>? item,
      String title,
      String? subtitle});

  $ArtworkCopyWith<$Res>? get artwork;
}

/// @nodoc
class _$MusicPlayerQueueEntryCopyWithImpl<$Res>
    implements $MusicPlayerQueueEntryCopyWith<$Res> {
  _$MusicPlayerQueueEntryCopyWithImpl(this._value, this._then);

  final MusicPlayerQueueEntry _value;
  // ignore: unused_field
  final $Res Function(MusicPlayerQueueEntry) _then;

  @override
  $Res call({
    Object? artwork = freezed,
    Object? id = freezed,
    Object? item = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
  }) {
    return _then(_value.copyWith(
      artwork: artwork == freezed
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Artwork?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      item: item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ArtworkCopyWith<$Res>? get artwork {
    if (_value.artwork == null) {
      return null;
    }

    return $ArtworkCopyWith<$Res>(_value.artwork!, (value) {
      return _then(_value.copyWith(artwork: value));
    });
  }
}

/// @nodoc
abstract class _$$_MusicPlayerQueueEntryCopyWith<$Res>
    implements $MusicPlayerQueueEntryCopyWith<$Res> {
  factory _$$_MusicPlayerQueueEntryCopyWith(_$_MusicPlayerQueueEntry value,
          $Res Function(_$_MusicPlayerQueueEntry) then) =
      __$$_MusicPlayerQueueEntryCopyWithImpl<$Res>;
  @override
  $Res call(
      {Artwork? artwork,
      String id,
      Map<String, dynamic>? item,
      String title,
      String? subtitle});

  @override
  $ArtworkCopyWith<$Res>? get artwork;
}

/// @nodoc
class __$$_MusicPlayerQueueEntryCopyWithImpl<$Res>
    extends _$MusicPlayerQueueEntryCopyWithImpl<$Res>
    implements _$$_MusicPlayerQueueEntryCopyWith<$Res> {
  __$$_MusicPlayerQueueEntryCopyWithImpl(_$_MusicPlayerQueueEntry _value,
      $Res Function(_$_MusicPlayerQueueEntry) _then)
      : super(_value, (v) => _then(v as _$_MusicPlayerQueueEntry));

  @override
  _$_MusicPlayerQueueEntry get _value =>
      super._value as _$_MusicPlayerQueueEntry;

  @override
  $Res call({
    Object? artwork = freezed,
    Object? id = freezed,
    Object? item = freezed,
    Object? title = freezed,
    Object? subtitle = freezed,
  }) {
    return _then(_$_MusicPlayerQueueEntry(
      artwork: artwork == freezed
          ? _value.artwork
          : artwork // ignore: cast_nullable_to_non_nullable
              as Artwork?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      item: item == freezed
          ? _value._item
          : item // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MusicPlayerQueueEntry implements _MusicPlayerQueueEntry {
  const _$_MusicPlayerQueueEntry(
      {this.artwork,
      required this.id,
      final Map<String, dynamic>? item,
      required this.title,
      this.subtitle})
      : _item = item;

  factory _$_MusicPlayerQueueEntry.fromJson(Map<String, dynamic> json) =>
      _$$_MusicPlayerQueueEntryFromJson(json);

  @override
  final Artwork? artwork;
  @override
  final String id;
  final Map<String, dynamic>? _item;
  @override
  Map<String, dynamic>? get item {
    final value = _item;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String title;
  @override
  final String? subtitle;

  @override
  String toString() {
    return 'MusicPlayerQueueEntry(artwork: $artwork, id: $id, item: $item, title: $title, subtitle: $subtitle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MusicPlayerQueueEntry &&
            const DeepCollectionEquality().equals(other.artwork, artwork) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other._item, _item) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.subtitle, subtitle));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(artwork),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(_item),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(subtitle));

  @JsonKey(ignore: true)
  @override
  _$$_MusicPlayerQueueEntryCopyWith<_$_MusicPlayerQueueEntry> get copyWith =>
      __$$_MusicPlayerQueueEntryCopyWithImpl<_$_MusicPlayerQueueEntry>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MusicPlayerQueueEntryToJson(this);
  }
}

abstract class _MusicPlayerQueueEntry implements MusicPlayerQueueEntry {
  const factory _MusicPlayerQueueEntry(
      {final Artwork? artwork,
      required final String id,
      final Map<String, dynamic>? item,
      required final String title,
      final String? subtitle}) = _$_MusicPlayerQueueEntry;

  factory _MusicPlayerQueueEntry.fromJson(Map<String, dynamic> json) =
      _$_MusicPlayerQueueEntry.fromJson;

  @override
  Artwork? get artwork => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  Map<String, dynamic>? get item => throw _privateConstructorUsedError;
  @override
  String get title => throw _privateConstructorUsedError;
  @override
  String? get subtitle => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MusicPlayerQueueEntryCopyWith<_$_MusicPlayerQueueEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

MusicPlayerQueue _$MusicPlayerQueueFromJson(Map<String, dynamic> json) {
  return _MusicPlayerQueue.fromJson(json);
}

/// @nodoc
mixin _$MusicPlayerQueue {
  List<MusicPlayerQueueEntry> get entries => throw _privateConstructorUsedError;
  MusicPlayerQueueEntry? get currentEntry => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MusicPlayerQueueCopyWith<MusicPlayerQueue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicPlayerQueueCopyWith<$Res> {
  factory $MusicPlayerQueueCopyWith(
          MusicPlayerQueue value, $Res Function(MusicPlayerQueue) then) =
      _$MusicPlayerQueueCopyWithImpl<$Res>;
  $Res call(
      {List<MusicPlayerQueueEntry> entries,
      MusicPlayerQueueEntry? currentEntry});

  $MusicPlayerQueueEntryCopyWith<$Res>? get currentEntry;
}

/// @nodoc
class _$MusicPlayerQueueCopyWithImpl<$Res>
    implements $MusicPlayerQueueCopyWith<$Res> {
  _$MusicPlayerQueueCopyWithImpl(this._value, this._then);

  final MusicPlayerQueue _value;
  // ignore: unused_field
  final $Res Function(MusicPlayerQueue) _then;

  @override
  $Res call({
    Object? entries = freezed,
    Object? currentEntry = freezed,
  }) {
    return _then(_value.copyWith(
      entries: entries == freezed
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<MusicPlayerQueueEntry>,
      currentEntry: currentEntry == freezed
          ? _value.currentEntry
          : currentEntry // ignore: cast_nullable_to_non_nullable
              as MusicPlayerQueueEntry?,
    ));
  }

  @override
  $MusicPlayerQueueEntryCopyWith<$Res>? get currentEntry {
    if (_value.currentEntry == null) {
      return null;
    }

    return $MusicPlayerQueueEntryCopyWith<$Res>(_value.currentEntry!, (value) {
      return _then(_value.copyWith(currentEntry: value));
    });
  }
}

/// @nodoc
abstract class _$$_MusicPlayerQueueCopyWith<$Res>
    implements $MusicPlayerQueueCopyWith<$Res> {
  factory _$$_MusicPlayerQueueCopyWith(
          _$_MusicPlayerQueue value, $Res Function(_$_MusicPlayerQueue) then) =
      __$$_MusicPlayerQueueCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<MusicPlayerQueueEntry> entries,
      MusicPlayerQueueEntry? currentEntry});

  @override
  $MusicPlayerQueueEntryCopyWith<$Res>? get currentEntry;
}

/// @nodoc
class __$$_MusicPlayerQueueCopyWithImpl<$Res>
    extends _$MusicPlayerQueueCopyWithImpl<$Res>
    implements _$$_MusicPlayerQueueCopyWith<$Res> {
  __$$_MusicPlayerQueueCopyWithImpl(
      _$_MusicPlayerQueue _value, $Res Function(_$_MusicPlayerQueue) _then)
      : super(_value, (v) => _then(v as _$_MusicPlayerQueue));

  @override
  _$_MusicPlayerQueue get _value => super._value as _$_MusicPlayerQueue;

  @override
  $Res call({
    Object? entries = freezed,
    Object? currentEntry = freezed,
  }) {
    return _then(_$_MusicPlayerQueue(
      entries: entries == freezed
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<MusicPlayerQueueEntry>,
      currentEntry: currentEntry == freezed
          ? _value.currentEntry
          : currentEntry // ignore: cast_nullable_to_non_nullable
              as MusicPlayerQueueEntry?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MusicPlayerQueue implements _MusicPlayerQueue {
  const _$_MusicPlayerQueue(
      {required final List<MusicPlayerQueueEntry> entries, this.currentEntry})
      : _entries = entries;

  factory _$_MusicPlayerQueue.fromJson(Map<String, dynamic> json) =>
      _$$_MusicPlayerQueueFromJson(json);

  final List<MusicPlayerQueueEntry> _entries;
  @override
  List<MusicPlayerQueueEntry> get entries {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  final MusicPlayerQueueEntry? currentEntry;

  @override
  String toString() {
    return 'MusicPlayerQueue(entries: $entries, currentEntry: $currentEntry)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MusicPlayerQueue &&
            const DeepCollectionEquality().equals(other._entries, _entries) &&
            const DeepCollectionEquality()
                .equals(other.currentEntry, currentEntry));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_entries),
      const DeepCollectionEquality().hash(currentEntry));

  @JsonKey(ignore: true)
  @override
  _$$_MusicPlayerQueueCopyWith<_$_MusicPlayerQueue> get copyWith =>
      __$$_MusicPlayerQueueCopyWithImpl<_$_MusicPlayerQueue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MusicPlayerQueueToJson(this);
  }
}

abstract class _MusicPlayerQueue implements MusicPlayerQueue {
  const factory _MusicPlayerQueue(
      {required final List<MusicPlayerQueueEntry> entries,
      final MusicPlayerQueueEntry? currentEntry}) = _$_MusicPlayerQueue;

  factory _MusicPlayerQueue.fromJson(Map<String, dynamic> json) =
      _$_MusicPlayerQueue.fromJson;

  @override
  List<MusicPlayerQueueEntry> get entries => throw _privateConstructorUsedError;
  @override
  MusicPlayerQueueEntry? get currentEntry => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_MusicPlayerQueueCopyWith<_$_MusicPlayerQueue> get copyWith =>
      throw _privateConstructorUsedError;
}
