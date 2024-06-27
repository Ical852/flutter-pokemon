import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';

class PokemonType extends StatelessWidget {
  String type;
  bool big;
  PokemonType({super.key,  required this.type, this.big = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 4,
        right: big ? 4 : 0
      ),
      padding: EdgeInsets.symmetric(
        horizontal: big ? 20 : 10,
        vertical: big ? 4 : 2
      ),
      decoration: BoxDecoration(
        color: getPokeColor(type),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color:whiteColor.withOpacity(0.3),
        ),
        boxShadow: [
          BoxShadow(
              color: whiteColor.withOpacity(0.1),
              blurRadius: 1,
              offset: Offset(0, 1)
            )
        ]
      ),
      child: Text(
        big ? capitalize(this.type) : this.type,
        style: (big ? regular : small).white.semiBold,
      ),
    );
  }
}