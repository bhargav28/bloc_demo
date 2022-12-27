import 'package:bloc_demo/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/album.dart';

abstract class AlbumRepository {

  Future<Either<Failure, List<Album>>> getAlbumList();

  Future<Either<Failure, List<Album>>> getSingleAlbum(String albumName);

}