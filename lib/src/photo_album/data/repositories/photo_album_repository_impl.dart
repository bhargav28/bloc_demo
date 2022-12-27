import 'package:bloc_demo/src/core/error/failure.dart';
import 'package:bloc_demo/src/photo_album/data/datasources/photo_album_remote_data_source.dart';
import 'package:bloc_demo/src/photo_album/domain/entities/photo_album.dart';
import 'package:bloc_demo/src/photo_album/domain/repositories/photo_album_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../core/exception/exception.dart';

class PhotoAlbumRepositoryImpl extends PhotoAlbumRepository {

  final PhotoAlbumDataSource _photoAlbumDataSource;

  PhotoAlbumRepositoryImpl(this._photoAlbumDataSource);

  @override
  Future<Either<Failure, List<PhotoAlbum>>> getPhotoAlbum(int albumId) async {
    debugPrint("getAlbumList called");
    try {
      var result = await _photoAlbumDataSource.getPhotoAlbum(albumId);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on PlatformFailure {
      return Left(PlatformFailure());
    } catch (e) {
      return Left(GenericFailure());
    }
  }

}