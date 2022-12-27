import 'package:bloc_demo/src/album/presentation/widgets/album_list_widget.dart';
import 'package:bloc_demo/src/album/presentation/widgets/search_box_widget.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/album.dart';

class SuccessStateWidget extends StatelessWidget {

  final List<Album> albumList;

  const SuccessStateWidget({Key? key, required this.albumList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlbumListWidget(albumList: albumList);
  }

}
