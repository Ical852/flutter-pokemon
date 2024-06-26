import 'package:flutter/material.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';

class PokemonType extends StatelessWidget {
  String type;
  PokemonType({super.key,  required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 4
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 2
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
        this.type,
        style: small.white.semiBold,
      ),
    );
  }
}