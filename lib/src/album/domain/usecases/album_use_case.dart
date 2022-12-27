
import 'package:bloc_demo/src/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import '../entities/album.dart';
import '../repositories/album_repository.dart';

class AlbumUseCase {

  final AlbumRepository _albumRepository;

  const AlbumUseCase(this._albumRepository);

  Future<Either<Failure, List<Album>>> call() async {
    return await _albumRepository.getAlbumList();
  }
}