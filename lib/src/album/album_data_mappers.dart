import 'package:bloc_demo/src/album/data/models/album_model.dart';
import 'package:bloc_demo/src/album/domain/entities/album.dart';

extension AlbumDataMappers on AlbumModel {
  Album toAlbum() {
    return Album(id: id!, userId: userId!, title: title!);
  }
}