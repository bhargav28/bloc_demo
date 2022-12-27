import 'package:bloc_demo/src/album/presentation/bloc/album_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../common/widgets/custom_textbox_widget.dart';

class SearchBoxWidget extends StatefulWidget {
  const SearchBoxWidget({Key? key}) : super(key: key);

  @override
  State<SearchBoxWidget> createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: CustomTextField(
        readOnly: false,
        height: 40,
        fieldController: searchController,
        color: Colors.white,
        hintName: "Search",
        maxLines: 1,
        keyboardType: TextInputType.text,
        onChange: (val) {
          if(val.isEmpty) {
            context.read<AlbumBloc>().add(GetAlbumListEvent());
          }
        },
        onEditingComplete: () {
          if(searchController.text.trim().isNotEmpty) {
            BlocProvider.of<AlbumBloc>(context).add(GetSingleAlbumEvent(searchController.text.trim()));
          } else {
            Fluttertoast.showToast(msg: "Search is not empty");
          }
          FocusScope.of(context).unfocus();
        },
        suffixIcon: IconButton(
          onPressed: () {
            if(searchController.text.isNotEmpty) {
              context.read<AlbumBloc>().add(GetSingleAlbumEvent(searchController.text.trim()));
            } else {
              Fluttertoast.showToast(msg: "Search is not empty");
            }
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
