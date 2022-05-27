import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_kit_platform_interface/model/artwork.dart';
import 'package:music_kit_platform_interface/music_kit_platform_interface.dart';

part 'music_player_queue.freezed.dart';
part 'music_player_queue.g.dart';

@freezed
class MusicPlayerQueueEntry with _$MusicPlayerQueueEntry {
  const factory MusicPlayerQueueEntry({
    Artwork? artwork,
    required String id,
    JSONObject? item,
    required String title,
    String? subtitle,
  }) = _MusicPlayerQueueEntry;

  factory MusicPlayerQueueEntry.fromJson(Map<String, Object?> json) =>
      _$MusicPlayerQueueEntryFromJson(json);
}

@freezed
class MusicPlayerQueue with _$MusicPlayerQueue {
  const factory MusicPlayerQueue({
    required List<MusicPlayerQueueEntry> entries,
    MusicPlayerQueueEntry? currentEntry,
  }) = _MusicPlayerQueue;

  factory MusicPlayerQueue.fromJson(Map<String, Object?> json) =>
      _$MusicPlayerQueueFromJson(json);
}
