// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_player_queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MusicPlayerQueueEntry _$$_MusicPlayerQueueEntryFromJson(Map json) =>
    _$_MusicPlayerQueueEntry(
      artwork: json['artwork'] == null
          ? null
          : Artwork.fromJson(Map<String, dynamic>.from(json['artwork'] as Map)),
      id: json['id'] as String,
      item: (json['item'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e),
      ),
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
    );

Map<String, dynamic> _$$_MusicPlayerQueueEntryToJson(
        _$_MusicPlayerQueueEntry instance) =>
    <String, dynamic>{
      'artwork': instance.artwork?.toJson(),
      'id': instance.id,
      'item': instance.item,
      'title': instance.title,
      'subtitle': instance.subtitle,
    };

_$_MusicPlayerQueue _$$_MusicPlayerQueueFromJson(Map json) =>
    _$_MusicPlayerQueue(
      entries: (json['entries'] as List<dynamic>)
          .map((e) => MusicPlayerQueueEntry.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      currentEntry: json['currentEntry'] == null
          ? null
          : MusicPlayerQueueEntry.fromJson(
              Map<String, Object?>.from(json['currentEntry'] as Map)),
    );

Map<String, dynamic> _$$_MusicPlayerQueueToJson(_$_MusicPlayerQueue instance) =>
    <String, dynamic>{
      'entries': instance.entries.map((e) => e.toJson()).toList(),
      'currentEntry': instance.currentEntry?.toJson(),
    };
