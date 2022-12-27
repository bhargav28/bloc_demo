
import 'package:bloc/bloc.dart';
import 'package:bloc_demo/src/core/error/failure.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/album.dart';
import '../../domain/usecases/album_use_case.dart';
import '../../domain/usecases/single_album_use_case.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {

  final AlbumUseCase albumUseCase;
  final SingleAlbumUseCase singleAlbumUseCase;

  AlbumBloc({required this.albumUseCase, required this.singleAlbumUseCase}) : super(LoadingState()) {

    on<AlbumEvent>((event, emit) async {
      emit(LoadingState());

      print("Album Bloc");

      final albumResult = await albumUseCase();

      albumResult.fold(
            (Failure failure) => emit(ErrorState()),
            (albums) {
              if(albums.isEmpty) {
                emit(EmptyState());
              } else {
                emit(SuccessState(albumList: albums));
              }
            },
      );
    });

    on<GetSingleAlbumEvent>((event, emit) async {
      emit(LoadingState());

      print("Single Album Bloc");

      final albumResult = await singleAlbumUseCase.call(event.albumName);

      albumResult.fold(
            (Failure failure) => emit(ErrorState()),
            (albums) {
          if(albums.isEmpty) {
            emit(EmptyState());
          } else {
            emit(SuccessState(albumList: albums));
          }
        },
      );
    });

  }


}
