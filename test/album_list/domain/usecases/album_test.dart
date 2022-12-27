import 'package:bloc_demo/src/album/data/repositories/album_repository_impl.dart';
import 'package:bloc_demo/src/album/domain/entities/album.dart';
import 'package:bloc_demo/src/album/domain/repositories/album_repository.dart';
import 'package:bloc_demo/src/album/domain/usecases/album_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


class MockAlbumRepositoryImpl extends Mock implements AlbumRepositoryImpl {}

void main() {

  late final MockAlbumRepositoryImpl mockAlbumRepositoryImpl;
  late final AlbumUseCase useCase;

  setUp(() {
    mockAlbumRepositoryImpl = MockAlbumRepositoryImpl();
    useCase = AlbumUseCase(mockAlbumRepositoryImpl);
  });

  List<Album> list = const [
    Album(id: 1, userId: 1, title: "title1"),
  ];
  
  test("initial value are correct or not", () async {
    reset(mockAlbumRepositoryImpl);

    when(mockAlbumRepositoryImpl.getAlbumList())
        .thenAnswer((_) async => Right(list));

    final result = useCase();
    // final result = await mockAlbumRemoteDataSource.getAlbumList();

    expect(result, list);
  });
}