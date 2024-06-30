// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';
import 'package:flutterpokemon/widgets/detail/base_stat_indicator.dart';

class BaseStatsContent extends StatelessWidget {
  PokemonDetailModel detail;
  BaseStatsContent({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    int getTotalValue() {
      int total = 0;
      for (var stat in detail.stats!) {
        total += stat.baseStat!;
      }
      return total;
    }

    Widget baseStats() {
      return BaseStatIndicator(detail: detail);
    }

    Widget totalValue() {
      return Container(
        child: Row(
          children: [
            Container(
              width: 100,
              child: Text(
                "Total",
                style: regular.mediumF.copyWith(
                  color: greyColor.withOpacity(0.7)
                ),
              ),
            ),
            Text(
              getTotalValue().toString(),
              style: regular.black.semiBold,
            )
          ],
        ),
      );
    }

    Widget typeDefense() {
      return Container(
        margin: EdgeInsets.only(top: 32, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Type Defenses",
              style: mega.black.blackBold,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "The effectiveness of each type on ${this.detail.name}.",
              style: regular.mediumF.copyWith(
                color: greyColor.withOpacity(0.7)
              ),
            )
          ],
        ),
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          baseStats(),
          totalValue(), 
          typeDefense()
        ],
      ),
    );
  }
}
