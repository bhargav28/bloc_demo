import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class AlbumModel {

  final int? id;
  final int? userId;
  final String? title;

  const AlbumModel(
      this.id,
      this.userId,
      this.title,
      );

  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}