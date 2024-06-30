// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  Function() onTap;
  DetailHeader({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ic_chevron_left.png")
                )
              ),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ic_change.png")
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}