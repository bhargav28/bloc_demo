import 'package:flutter/material.dart';

import '../../domain/entities/photo_album.dart';

class PhotoAlbumSuccessStatePage extends StatelessWidget {

  final List<PhotoAlbum> photoAlbumList;

  const PhotoAlbumSuccessStatePage({Key? key, required this.photoAlbumList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: photoAlbumList.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            photoAlbumList[index].url,
            errorBuilder: (context, _, __) => Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
