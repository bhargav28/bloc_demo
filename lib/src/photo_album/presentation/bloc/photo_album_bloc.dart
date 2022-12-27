import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/src/album/presentation/bloc/album_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/photo_album.dart';
import '../../domain/usecases/photo_album_use_case.dart';

part 'photo_album_event.dart';
part 'photo_album_state.dart';

class PhotoAlbumBloc extends Bloc<PhotoAlbumEvent, PhotoAlbumState> {

  final PhotoAlbumUseCase photoAlbumUseCase;

  PhotoAlbumBloc({required this.photoAlbumUseCase}) : super(PhotoAlbumLoadingState()) {

    on<GetPhotoAlbumEvent>((event, emit) async {
      emit(PhotoAlbumLoadingState());

      final result = await photoAlbumUseCase.call(event.albumId);

      result.fold(
            (l) => emit(PhotoAlbumErrorState()),
            (r) {
              if(r.isNotEmpty) {
                emit(PhotoAlbumSuccessState(r));
              } else {
                emit(PhotoAlbumEmptyState());
              }
            },
      );
    });
  }
}
