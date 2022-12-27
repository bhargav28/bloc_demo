import 'package:bloc_demo/src/photo_album/presentation/bloc/photo_album_bloc.dart';
import 'package:bloc_demo/src/photo_album/presentation/pages/photo_album_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../get_it_config/get_it_config.dart';
import '../../domain/entities/album.dart';
import '../bloc/album_bloc.dart';

class AlbumListWidget extends StatelessWidget {

  final List<Album> albumList;

  const AlbumListWidget({Key? key, required this.albumList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlbumBloc>(
      create: (_) => sl.get<AlbumBloc>(),
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: albumList.length,
          itemBuilder: (context, index) =>  InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoAlbumPage(albumId: albumList[index].id),
                ),
              );
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black54),
              ),
              child: Text(
                albumList[index].title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


}

