import 'package:bloc_demo/src/album/domain/entities/album.dart';
import 'package:bloc_demo/src/album/domain/repositories/album_repository.dart';
import 'package:bloc_demo/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class SingleAlbumUseCase {

  final AlbumRepository albumRepository;

  SingleAlbumUseCase({required this.albumRepository});

  Future<Either<Failure, List<Album>>> call(String albumName) async {
    return albumRepository.getSingleAlbum(albumName);
  }

}