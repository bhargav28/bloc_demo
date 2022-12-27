import 'package:bloc_demo/src/album/presentation/bloc/album_bloc.dart';
import 'package:bloc_demo/src/album/presentation/widgets/empty_state_widget.dart';
import 'package:bloc_demo/src/album/presentation/widgets/error_state_widget.dart';
import 'package:bloc_demo/src/album/presentation/widgets/loading_state_widget.dart';
import 'package:bloc_demo/src/album/presentation/widgets/success_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../get_it_config/get_it_config.dart';
import '../widgets/search_box_widget.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider<AlbumBloc>(
          create: (_) => sl<AlbumBloc>()..add(GetAlbumListEvent()),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SearchBoxWidget(),

              const SizedBox(height: 20),
              BlocBuilder<AlbumBloc, AlbumState>(
                builder: (context, state) {
                  if (state is EmptyState) {
                    return const EmptyStateWidget();
                  } else if (state is LoadingState) {
                    return const LoadingStateWidget();
                  } else if (state is ErrorState) {
                    return const ErrorStateWidget();
                  } else if (state is SuccessState) {
                    return SuccessStateWidget(albumList: state.albumList,);
                  }
                  return const SizedBox();
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
