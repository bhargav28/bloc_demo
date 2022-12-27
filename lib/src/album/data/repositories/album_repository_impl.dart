import 'package:bloc_demo/src/album/data/datasources/album_remote_data_source.dart';
import 'package:bloc_demo/src/album/domain/entities/album.dart';
import 'package:bloc_demo/src/album/domain/repositories/album_repository.dart';
import 'package:bloc_demo/src/core/error/failure.dart';
import 'package:bloc_demo/src/core/exception/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class AlbumRepositoryImpl extends AlbumRepository {

  final AlbumRemoteDataSource _albumRemoteDataSource;

  AlbumRepositoryImpl(this._albumRemoteDataSource);

  @override
  Future<Either<Failure, List<Album>>> getAlbumList() async {
    debugPrint("getAlbumList called");
    try {
      var result = await _albumRemoteDataSource.getAlbumList();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on PlatformFailure {
      return Left(PlatformFailure());
    } catch (e) {
      return Left(GenericFailure());
    }
  }

  @override
  Future<Either<Failure, List<Album>>> getSingleAlbum(String albumName) async {
    debugPrint("getSingleAlbumList called");
    try {
      var result = await _albumRemoteDataSource.getSingleAlbumList(albumName);
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