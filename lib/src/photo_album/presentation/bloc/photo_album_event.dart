part of 'photo_album_bloc.dart';

abstract class PhotoAlbumEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPhotoAlbumEvent extends PhotoAlbumEvent {

  final int albumId;

  GetPhotoAlbumEvent(this.albumId);

  @override
  List<Object> get props => [albumId];

}
