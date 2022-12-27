part of 'photo_album_bloc.dart';

abstract class PhotoAlbumState extends Equatable {
  @override
  List<Object> get props => [];
}

class PhotoAlbumEmptyState extends PhotoAlbumState {}

class PhotoAlbumLoadingState extends PhotoAlbumState {}

class PhotoAlbumErrorState extends PhotoAlbumState {}

class PhotoAlbumSuccessState extends PhotoAlbumState {

  final List<PhotoAlbum> photoAlbumList;

  PhotoAlbumSuccessState(this.photoAlbumList);

  @override
  List<Object> get props => [photoAlbumList];

}

