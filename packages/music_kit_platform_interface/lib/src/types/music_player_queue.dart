import 'package:json_annotation/json_annotation.dart';

import 'artwork.dart';
import 'types.dart';

part 'music_player_queue.g.dart';

/// An entry for the playback queue of the music player.
@JsonSerializable()
class MusicPlayerQueueEntry {
  const MusicPlayerQueueEntry({
    this.artwork,
    required this.id,
    this.item,
    required this.title,
    this.subtitle,
  });

  /// The artwork of this entry of the playback queue.
  final Artwork? artwork;

  /// The unique identifier of this entry of the playback queue.
  final String id;

  /// A music item that corresponds to this entry of the playback queue, such as a song or a music video.
  final JSONObject? item;

  /// The title of this entry of the playback queue.
  final String title;

  /// The subtitle of this entry of the playback queue.
  final String? subtitle;

  factory MusicPlayerQueueEntry.fromJson(Map<String, Object?> json) => _$MusicPlayerQueueEntryFromJson(json);

  Map<String, dynamic> toJson() => _$MusicPlayerQueueEntryToJson(this);
}

@JsonSerializable()
class MusicPlayerQueue {
  MusicPlayerQueue({
    required this.entries,
    this.currentEntry,
  });

  final List<MusicPlayerQueueEntry> entries;
  final MusicPlayerQueueEntry? currentEntry;

  // const factory MusicPlayerQueue({
  //   required List<MusicPlayerQueueEntry> entries,
  //   MusicPlayerQueueEntry? currentEntry,
  // }) = _MusicPlayerQueue;

  factory MusicPlayerQueue.fromJson(Map<String, Object?> json) => _$MusicPlayerQueueFromJson(json);
}
