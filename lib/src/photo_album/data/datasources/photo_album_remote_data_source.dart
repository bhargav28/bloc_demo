import 'package:bloc_demo/src/core/error/failure.dart';
import 'package:bloc_demo/src/photo_album/domain/entities/photo_album.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/exception/exception.dart';

class PhotoAlbumDataSource {

  final Dio _dio;

  const PhotoAlbumDataSource(this._dio);

  Future<List<PhotoAlbum>> getPhotoAlbum(int albumId) async {
    debugPrint("getPhotoAlbum api called");
    try {
      Response response = await _dio.get("https://jsonplaceholder.typicode.com/albums/$albumId/photos");
      debugPrint("Data : ${response.data}");
      List<PhotoAlbum> list = [];
      for(Map<String, dynamic> i in response.data) {
        list.add(PhotoAlbum(
          albumId: i["albumId"],
          id: i["id"],
          title: i["title"],
          url: i["url"],
          thumbnailUrl: i["thumbnailUrl"],
        ));
      }
      return list;
    } catch (e) {
      debugPrint("Data Error: $e");
      throw ServerException();
    }
  }

}