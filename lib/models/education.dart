import 'package:json_annotation/json_annotation.dart';

part 'education.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Education {
    const Education({
        this.id,
        required this.title,
        this.category = 'pendidikan',
        this.image,
        required this.start,
        this.end,
    });

    factory Education.fromJson(Map<String, dynamic> json) =>
        _$EducationFromJson(json);

    @JsonKey(includeToJson: false)
    final String? id;

    final String title;
    final String category;
    final String start;

    @JsonKey(includeToJson: false)
    final String? image;

    final String? end;

    Map<String, dynamic> toJson() => _$EducationToJson(this);

}