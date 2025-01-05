// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_player_queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicPlayerQueueEntry _$MusicPlayerQueueEntryFromJson(Map json) =>
    MusicPlayerQueueEntry(
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

Map<String, dynamic> _$MusicPlayerQueueEntryToJson(
        MusicPlayerQueueEntry instance) =>
    <String, dynamic>{
      'artwork': instance.artwork?.toJson(),
      'id': instance.id,
      'item': instance.item,
      'title': instance.title,
      'subtitle': instance.subtitle,
    };

MusicPlayerQueue _$MusicPlayerQueueFromJson(Map json) => MusicPlayerQueue(
      entries: (json['entries'] as List<dynamic>)
          .map((e) => MusicPlayerQueueEntry.fromJson(
              Map<String, Object?>.from(e as Map)))
          .toList(),
      currentEntry: json['currentEntry'] == null
          ? null
          : MusicPlayerQueueEntry.fromJson(
              Map<String, Object?>.from(json['currentEntry'] as Map)),
    );

Map<String, dynamic> _$MusicPlayerQueueToJson(MusicPlayerQueue instance) =>
    <String, dynamic>{
      'entries': instance.entries.map((e) => e.toJson()).toList(),
      'currentEntry': instance.currentEntry?.toJson(),
    };
