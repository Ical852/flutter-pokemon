// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_result_model.dart';
import 'package:flutterpokemon/screens/detail_pages/detail_page.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';
import 'package:flutterpokemon/widgets/main/pokemon_type.dart';

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

      String getImage() {
        if (detail!.sprites!.other!.showdown!.frontDefault != null) {
          return detail.sprites!.other!.showdown!.frontDefault!;
        }
        return detail.sprites!.frontDefault!;
      }

      void onPress() {
        Navigator.push(context, 
          MaterialPageRoute(
            builder: (context) => DetailPage(this.pokemon)
          )
        );
      }

      Widget pokeTitle() {
        return Text(
          capitalize(detail!.name!),
          style: medium.white.semiBold,
        );
      }

      Widget pokemon() {
        return Expanded(
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start ,
                children: detail!.types!.map((type) => PokemonType( type: type.type!.name!,)).toList(),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: NetworkImage(getImage())
                    )
                  ),
                ),
              )
            ],
          ),
        );
      }

      return GestureDetector(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.all(12),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              pokeTitle(),
              SizedBox(height: 6),
              pokemon()
            ],
          ),
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