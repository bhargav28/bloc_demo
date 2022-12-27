// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) => AlbumModel(
      json['id'] as int?,
      json['user_id'] as int?,
      json['title'] as String?,
    );

Map<String, dynamic> _$AlbumModelToJson(AlbumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
    };
