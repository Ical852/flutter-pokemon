import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_result_model.dart';

class DetailPage extends StatelessWidget {
  PokemonResultModel pokemon;
  DetailPage(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: getWH(context, 'heigth') * 0.5,
                  width: double.infinity,
                  color: this.pokemon.detail!.bgColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
