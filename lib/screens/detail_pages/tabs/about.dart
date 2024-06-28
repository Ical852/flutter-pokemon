import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';

class AboutContent extends StatelessWidget {
  PokemonDetailModel detail;
  AboutContent({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    String getGroupName() {
      if (detail.group != null) {
        return detail.group!.name!;
      }
      return "none";
    }

    Map<String, String> abouts = {
      "Species": capitalize(detail.species!.name!),
      "Height": detail.height.toString() + " cm",
      "Weight": detail.height.toString() + " kg",
      "Abilities": detail.abilities!
          .map((ability) => capitalize(ability.ability!.name!))
          .join(', ')
    };
    Map<String, String> breedings = {
      "Gender": "Male, Female",
      "Egg Groups": capitalize(getGroupName()),
      "Egg Cycle": capitalize(detail.types!.first.type!.name!),
    };

    Widget recordRenderer(Map<String, String> datas) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: datas.keys
                  .map((key) => Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text(
                          key,
                          style: regular.mediumF
                              .copyWith(color: greyColor.withOpacity(0.7)),
                        ),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: datas.keys
                  .map((key) => Container(
                        margin: EdgeInsets.only(bottom: 12),
                        child: Text(
                          datas[key].toString(),
                          style: regular.black.semiBold,
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      );
    }

    Widget aboutsTop() {
      return recordRenderer(abouts);
    }

    Widget breeding() {
      return Container(
        margin: EdgeInsets.only(top: 12, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Breeding",
              style: mega.black.blackBold,
            ),
            SizedBox(height: 12),
            recordRenderer(breedings)
          ],
        ),
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          aboutsTop(),
          breeding(),
        ],
      ),
    );
  }
}
