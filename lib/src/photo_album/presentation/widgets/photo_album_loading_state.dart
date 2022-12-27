import 'package:flutter/material.dart';

class PhotoAlbumLoadingStatePage extends StatelessWidget {
  const PhotoAlbumLoadingStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
