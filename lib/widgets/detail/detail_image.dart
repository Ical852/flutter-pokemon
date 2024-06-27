import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  String image;
  double height, width;
  DetailImage(
      {super.key,
      required this.image,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: this.width * 0.5,
        margin: EdgeInsets.only(top: this.height * 0.2),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain, image: NetworkImage(this.image))));
  }
}
