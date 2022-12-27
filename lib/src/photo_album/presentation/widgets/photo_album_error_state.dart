import 'package:flutter/material.dart';

class PhotoAlbumErrorStatePage extends StatelessWidget {
  const PhotoAlbumErrorStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Try again later!",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
    );
  }
}
