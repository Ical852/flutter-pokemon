import 'package:flutter/material.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';

class LoadMoreButton extends StatelessWidget {
  Function() onPress;
  
  LoadMoreButton({ required this.onPress });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: infoColor
      ),
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent.withOpacity(0.1),
        ),
        onPressed: this.onPress,
        child: Text(
          "Load More",
          style: base.white.semiBold
        ),
      ),
    );
  }
}