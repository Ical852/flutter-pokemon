// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';

class EvolutionContent extends StatelessWidget {
  PokemonDetailModel detail;
  EvolutionContent({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: detail.evolutions!.map((evo) {
          return Text(evo.name!);
        }).toList(),
      ),
    );
  }
}
