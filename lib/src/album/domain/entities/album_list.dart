import 'package:equatable/equatable.dart';

import 'album.dart';

class AlbumList extends Equatable {

  final List<Album> albumList;

  const AlbumList({required this.albumList});

  @override
  List<Object?> get props => [albumList];
}