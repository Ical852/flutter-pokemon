// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';
import 'package:flutterpokemon/shared/text_styles.dart';
import 'package:flutterpokemon/widgets/main/pokemon_type.dart';

class DetailDescription extends StatelessWidget {
  PokemonDetailModel detail;
  DetailDescription({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 72, 
        left: 24, 
        right: 24
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                capitalize(detail.name!),
                style: extra.white.semiBold.copyWith(fontSize: 32),
              ),
              SizedBox(height: 6),
              Row(
                children: detail.types!
                  .map((type) => 
                    PokemonType(
                      big: true,
                      type: type.type!.name!,
                    )
                  ).toList(),
              )
            ],
          ),
          Text(
            '#${detail.id.toString()}',
            style: extra.white.semiBold,
          )
        ],
      ),
    );
  }
}