
import 'package:bloc_demo/src/album/data/datasources/album_remote_data_source.dart';
import 'package:bloc_demo/src/album/data/repositories/album_repository_impl.dart';
import 'package:bloc_demo/src/album/domain/repositories/album_repository.dart';
import 'package:bloc_demo/src/album/domain/usecases/album_use_case.dart';
import 'package:bloc_demo/src/album/domain/usecases/single_album_use_case.dart';
import 'package:bloc_demo/src/album/presentation/bloc/album_bloc.dart';
import 'package:bloc_demo/src/photo_album/data/datasources/photo_album_remote_data_source.dart';
import 'package:bloc_demo/src/photo_album/data/repositories/photo_album_repository_impl.dart';
import 'package:bloc_demo/src/photo_album/domain/repositories/photo_album_repository.dart';
import 'package:bloc_demo/src/photo_album/domain/usecases/photo_album_use_case.dart';
import 'package:bloc_demo/src/photo_album/presentation/bloc/photo_album_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {

  // Bloc
  sl.registerFactory(() => AlbumBloc(
    albumUseCase: sl(),
    singleAlbumUseCase: sl(),
  ));

  sl.registerFactory(() => PhotoAlbumBloc(photoAlbumUseCase: sl()));

  // Use cases
  sl.registerLazySingleton(() => AlbumUseCase(sl()));
  sl.registerLazySingleton(() => SingleAlbumUseCase(albumRepository: sl()));
  sl.registerLazySingleton(() => PhotoAlbumUseCase(sl()));

  // Repository
  sl.registerLazySingleton<AlbumRepository>(
        () => AlbumRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<PhotoAlbumRepository>(() => PhotoAlbumRepositoryImpl(sl()));

  // Data Source
  sl.registerLazySingleton<AlbumRemoteDataSource>(
        () => AlbumRemoteDataSource(sl()),
  );
  sl.registerLazySingleton<PhotoAlbumDataSource>(() => PhotoAlbumDataSource(sl()));

  // External
  sl.registerLazySingleton(() => Dio());

}
