
import 'package:json_annotation/json_annotation.dart';

part 'photo_album_model.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake)
class PhotoAlbumModel {

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoAlbumModel(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  factory PhotoAlbumModel.fromJson(Map<String, dynamic> json) => _$PhotoAlbumModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoAlbumModelToJson(this);

}