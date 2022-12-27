import 'package:bloc_demo/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../entities/photo_album.dart';

abstract class PhotoAlbumRepository {

  Future<Either<Failure, List<PhotoAlbum>>> getPhotoAlbum(int albumId);

}