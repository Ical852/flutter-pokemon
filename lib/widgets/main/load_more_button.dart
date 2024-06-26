import 'package:flutter/material.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';

class LoadMoreButton extends StatelessWidget {
  Function() onPress;
  
  LoadMoreButton({ required this.onPress });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 24
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: infoColor
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
          "Load More",
          style: medium.white.semiBold
        ),
      ),
    );
  }
}