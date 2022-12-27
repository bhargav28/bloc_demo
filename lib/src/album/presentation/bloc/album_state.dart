part of 'album_bloc.dart';

abstract class AlbumState extends Equatable {
  @override
  List<Object> get props => [];
}

class EmptyState extends AlbumState {}

class LoadingState extends AlbumState {}

class SuccessState extends AlbumState{

  final List<Album> albumList;

  SuccessState({required this.albumList});

  @override
  List<Object> get props => [albumList];

}

class ErrorState extends AlbumState {}

