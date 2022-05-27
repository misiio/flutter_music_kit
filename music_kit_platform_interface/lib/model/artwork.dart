import 'package:freezed_annotation/freezed_annotation.dart';

part 'artwork.freezed.dart';
part 'artwork.g.dart';

@freezed
class Artwork with _$Artwork {
  const factory Artwork({
    String? bgColor,
    required num height,
    String? textColor1,
    String? textColor2,
    String? textColor3,
    String? textColor4,
    required String url,
    required num width,
  }) = _Artwork;

  factory Artwork.fromJson(Map<String, dynamic> json) =>
      _$ArtworkFromJson(json);
}
