import 'package:bloc_demo/src/core/error/failure.dart';
import 'package:bloc_demo/src/photo_album/domain/entities/photo_album.dart';
import 'package:bloc_demo/src/photo_album/domain/repositories/photo_album_repository.dart';
import 'package:dartz/dartz.dart';

class PhotoAlbumUseCase {

  final PhotoAlbumRepository _photoAlbumRepository;

  PhotoAlbumUseCase(this._photoAlbumRepository);

  Future<Either<Failure, List<PhotoAlbum>>> call(int albumId) async {
    return await _photoAlbumRepository.getPhotoAlbum(albumId);
  }

}