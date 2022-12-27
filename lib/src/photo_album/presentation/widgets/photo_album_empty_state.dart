import 'package:flutter/material.dart';

class PhotoAlbumEmptyStatePage extends StatelessWidget {
  const PhotoAlbumEmptyStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No Photos are available.",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
    );
  }
}
