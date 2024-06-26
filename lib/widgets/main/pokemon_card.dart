import 'package:flutter/material.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_model.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_result_model.dart';
import 'package:flutterpokemon/shared/constants.dart';

class PokemonCard extends StatelessWidget {
  PokemonResultModel pokemon;
  PokemonCard({
    super.key,
    required this.pokemon,
    });
    

  @override
  Widget build(BuildContext context) {
    if (this.pokemon.detail != null) {
      var detail = this.pokemon.detail;

      return Container(
        decoration: BoxDecoration(
          color: detail!.bgColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: blackColor.withOpacity(0.4),
              blurRadius: 4,
              offset: Offset(0, 4)
            )
          ]
        ),
      );
    }

    return Container(
      child: Center(
        child: CircularProgressIndicator(
          color: greyColor,
        ),
      ),
    );
  }
}