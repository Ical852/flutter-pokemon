// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  String image;
  DetailImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
        fit: BoxFit.contain,
          image: NetworkImage(this.image)
        )
      )
    );
  }
}
