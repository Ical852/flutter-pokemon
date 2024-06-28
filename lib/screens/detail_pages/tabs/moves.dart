import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';

class MovesContent extends StatelessWidget {
  PokemonDetailModel detail;
  MovesContent({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: detail.moves!.map((move) {
          index++;
          return Container(
            margin: EdgeInsets.only(bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${index}. " + capitalize(move.move!.name!),
                  style: medium.semiBold.copyWith(color: detail.bgColor),
                ),
                Container(
                  margin: EdgeInsets.only(left: 18, top: 6),
                  child: Text(
                    "- Move version group",
                    style: regular.black.semiBold,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: move.versionGroupDetails!.map((det) {
                    return Container(
                      margin: EdgeInsets.only(left: 28, bottom: 4),
                      child: Text(
                        capitalize(det.moveLearnMethod!.name!) +
                            " - " +
                            capitalize(det.versionGroup!.name!),
                        style:
                            regular.copyWith(color: greyColor.withOpacity(0.7)),
                      ),
                    );
                  }).toList(),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
