// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoAlbumModel _$PhotoAlbumModelFromJson(Map<String, dynamic> json) =>
    PhotoAlbumModel(
      json['album_id'] as int,
      json['id'] as int,
      json['title'] as String,
      json['url'] as String,
      json['thumbnail_url'] as String,
    );

Map<String, dynamic> _$PhotoAlbumModelToJson(PhotoAlbumModel instance) =>
    <String, dynamic>{
      'album_id': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnail_url': instance.thumbnailUrl,
    };
