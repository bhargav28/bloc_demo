import 'dart:convert';

import 'package:bloc_demo/src/album/data/models/album_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final Map<String, dynamic> jsonMap = jsonDecode(fixture("album.json"));
  final tAlbumModel = AlbumModel.fromJson(jsonMap);

  test("should be a AlbumModel", () async {
    expect(tAlbumModel, isA<AlbumModel>());
  });

}