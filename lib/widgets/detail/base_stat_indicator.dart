// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';

class BaseStatIndicator extends StatelessWidget {
  PokemonDetailModel detail;
  BaseStatIndicator({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    Widget statKeys() {
      return Container(
        width: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: detail.stats!.map((stat) {
            return Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Text(
                capitalize(stat.stat!.reFormat(stat.stat!.name!)),
                style: regular.mediumF.copyWith(
                  color: greyColor.withOpacity(0.7)
                ),
              ),
            );
          }).toList(),
        ),
      );
    }

    Widget statIndicator() {
      return Container(
        height: 192,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: detail.stats!.map((stat) {
            return Stack(
              children: [
                Container(
                  height: 4,
                  margin: EdgeInsets.only(top: 9.5, bottom: 18),
                  decoration: BoxDecoration(
                    color: greyColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(2)
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: stat.baseStat! / 100 > 1 ? 1 : stat.baseStat! / 100,
                  child: Container(
                    height: 4,
                    margin: EdgeInsets.only(top: 9.5, bottom: 18),
                    decoration: BoxDecoration(
                      color: detail.bgColor,
                      borderRadius: BorderRadius.circular(2)
                    ),
                  ),
                )
              ],
            );
          }).toList(),
        ),
      );
    }

    Widget statValue() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: detail.stats!.map((stat) {
            return Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Text(
                stat.baseStat.toString(),
                style: regular.black.semiBold
              ),
            );
          }).toList(),
        ),
      );
    }

    Widget statPoint() {
      return Row(
        children: [
          statValue(),
          SizedBox(
            width: 12,
          ),
          Expanded(child: statIndicator())
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        statKeys(),
        Expanded(
          child: statPoint()
        )
      ],
    );
  }
}