import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No albums are available.",
        style: TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
    );
  }
}
