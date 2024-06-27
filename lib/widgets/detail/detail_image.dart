import 'package:flutter/material.dart';

class DetailImage extends StatelessWidget {
  String image;
  double height, width;
  DetailImage({
    super.key,
    required this.image,
    required this.height,
    required this.width
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
