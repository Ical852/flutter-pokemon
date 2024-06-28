import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';

class BaseStatsContent extends StatelessWidget {
  PokemonDetailModel detail;
  BaseStatsContent({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    Widget statKeys() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: detail.stats!
            .map((stat) => Container(
                  margin: EdgeInsets.only(bottom: 12),
                  child: Text(
                    capitalize(stat.stat!.reFormat(stat.stat!.name!)),
                    style: regular.mediumF
                        .copyWith(color: greyColor.withOpacity(0.7)),
                  ),
                ))
            .toList(),
      );
    }

    Widget baseStats() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [statKeys()],
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [baseStats()],
      ),
    );
  }
}
