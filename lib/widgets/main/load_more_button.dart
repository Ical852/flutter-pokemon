// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutterpokemon/shared/text_styles.dart';

class LoadMoreButton extends StatelessWidget {
  Function() onPress;
  String title;
  Color color;

  LoadMoreButton({required this.onPress, this.title = "Load More", this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: this.color
      ),
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent.withOpacity(0.1),
        ),
        onPressed: this.onPress,
        child: Text(
          title,
          style: medium.white.semiBold
        ),
      ),
    );
  }
}
