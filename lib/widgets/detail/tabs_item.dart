import 'package:flutter/material.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';

class TabsItem extends StatelessWidget {
  String text, currentTab;
  Function() onPress;
  TabsItem(
      {super.key,
      required this.text,
      required this.currentTab,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    var isCurrent = text == currentTab;
    TextStyle getStyle() {
      if (isCurrent) return regular.black.blackBold;
      return regular.grey.blackBold;
    }

    Color getColor() {
      if (isCurrent) return blackColor;
      return Colors.transparent;
    }

    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: getColor()))),
        child: Text(
          text,
          style: getStyle(),
        ),
      ),
    );
  }
}
