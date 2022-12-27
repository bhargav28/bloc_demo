import 'package:bloc_demo/src/photo_album/presentation/bloc/photo_album_bloc.dart';
import 'package:bloc_demo/src/photo_album/presentation/widgets/photo_album_empty_state.dart';
import 'package:bloc_demo/src/photo_album/presentation/widgets/photo_album_error_state.dart';
import 'package:bloc_demo/src/photo_album/presentation/widgets/photo_album_success_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../get_it_config/get_it_config.dart';
import '../widgets/photo_album_loading_state.dart';

class PhotoAlbumPage extends StatelessWidget {

  final int albumId;

  const PhotoAlbumPage({Key? key, required this.albumId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: Colors.white,
        ),
      ),
      body: BlocProvider(
        create: (_) => sl<PhotoAlbumBloc>()..add(GetPhotoAlbumEvent(albumId)),
        child: BlocBuilder<PhotoAlbumBloc, PhotoAlbumState>(
          builder: (context, state) {
            if(state is PhotoAlbumLoadingState) {
              return const PhotoAlbumLoadingStatePage();
            } else if(state is PhotoAlbumEmptyState) {
              return const PhotoAlbumEmptyStatePage();
            } else if(state is PhotoAlbumErrorState) {
              return const PhotoAlbumErrorStatePage();
            } else if(state is PhotoAlbumSuccessState) {
              return PhotoAlbumSuccessStatePage(photoAlbumList: state.photoAlbumList);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
