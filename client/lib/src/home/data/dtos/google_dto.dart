import 'package:client/src/home/domain/entities/google_entity.dart';

class GoogleDto extends GoogleEntity {
  String? titleDto;
  String? linkDto;

  GoogleDto({
    this.titleDto,
    this.linkDto,
  }) : super(
          title: titleDto,
          link: linkDto,
        );

  factory GoogleDto.fromJson(Map<String, dynamic> json) => GoogleDto(
        titleDto: json["title"],
        linkDto: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "title": titleDto,
        "link": linkDto,
      };
}
