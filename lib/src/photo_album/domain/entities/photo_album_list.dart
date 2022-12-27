import 'package:equatable/equatable.dart';

import 'photo_album.dart';

class PhotoAlbumList extends Equatable {

  final List<PhotoAlbum> photoAlbumList;

  const PhotoAlbumList({required this.photoAlbumList});

  @override
  List<Object?> get props => [photoAlbumList];

}