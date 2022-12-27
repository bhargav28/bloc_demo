part of 'album_bloc.dart';

abstract class AlbumEvent extends Equatable {

  @override
  List<Object?> get props => [];

}

class GetAlbumListEvent extends AlbumEvent {}

class GetSingleAlbumEvent extends AlbumEvent {

  final String albumName;

  GetSingleAlbumEvent(this.albumName);

  @override
  List<Object?> get props => [albumName];
}
