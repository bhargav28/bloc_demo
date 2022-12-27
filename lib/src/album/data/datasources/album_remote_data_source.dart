import 'package:bloc_demo/src/album/domain/entities/album.dart';
import 'package:bloc_demo/src/core/exception/exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';

class AlbumRemoteDataSource {

  final Dio _dio;

  const AlbumRemoteDataSource(this._dio);

  Future<List<Album>> getAlbumList() async {
    debugPrint("Api called");
    try {
      Response response = await _dio.get("https://jsonplaceholder.typicode.com/albums");
      debugPrint("Data : ${response.data}");
      List<Album> list = [];
      for(Map<String, dynamic> i in response.data) {
        list.add(Album(id: i["id"], userId: i["userId"], title: i["title"]));
        // list.add(AlbumModel.fromJson(i).toAlbum());
      }
      return list;
    } catch (e) {
      debugPrint("Data Error: $e");
      throw ServerException();
    }
  }

  Future<List<Album>> getSingleAlbumList(String albumName) async {
    debugPrint("Single Album Api called");
    try {
      Response response = await _dio.get("https://jsonplaceholder.typicode.com/albums?title=$albumName");
      debugPrint("Data : ${response.data}");
      List<Album> list = [];
      for(Map<String, dynamic> i in response.data) {
        list.add(Album(id: i["id"], userId: i["userId"], title: i["title"]));
        // list.add(AlbumModel.fromJson(i).toAlbum());
      }
      return list;
    } catch (e) {
      debugPrint("Data Error: $e");
      throw ServerException();
    }
  }
}