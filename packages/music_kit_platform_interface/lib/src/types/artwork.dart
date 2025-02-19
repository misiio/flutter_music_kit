import 'package:json_annotation/json_annotation.dart';

part 'artwork.g.dart';

@JsonSerializable()
class Artwork {
  const Artwork({
    this.bgColor,
    required this.height,
    this.textColor1,
    this.textColor2,
    this.textColor3,
    this.textColor4,
    required this.url,
    required this.width,
  });

  final String? bgColor;
  final num height;
  final String? textColor1;
  final String? textColor2;
  final String? textColor3;
  final String? textColor4;
  final String url;
  final num width;

  factory Artwork.fromJson(Map<String, dynamic> json) => _$ArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$ArtworkToJson(this);
}
