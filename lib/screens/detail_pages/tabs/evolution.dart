// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';
import 'package:flutterpokemon/widgets/detail/base_stat_indicator.dart';
import 'package:flutterpokemon/widgets/main/pokemon_type.dart';

class EvolutionContent extends StatefulWidget {
  PokemonDetailModel detail;
  EvolutionContent({super.key, required this.detail});

  @override
  State<EvolutionContent> createState() => _EvolutionContentState();
}

class _EvolutionContentState extends State<EvolutionContent> {
  String currentType = "pics";
  Map<String, CarouselController> controllers = {
    "1": CarouselController(),
    "2": CarouselController(),
    "3": CarouselController(),
  };

  @override
  Widget build(BuildContext context) {
    Color bgColor = this.widget.detail.bgColor!;
    List<dynamic> getEvoGif(PokemonDetailModel evoDetail) {
      return getGifList(evoDetail.sprites!.other!.showdown!);
    }
    List<dynamic> getEvoPic(PokemonDetailModel evoDetail) {
      return getPicList(evoDetail.sprites!);
    }
    List<dynamic> getEvoSlide(PokemonDetailModel evoDetail) {
      return this.currentType == "gifs" ? getEvoGif(evoDetail) : getEvoPic(evoDetail);
    }
    List<String> toggles = ["pics", "gifs"];
    int getTotalValue(PokemonDetailModel detail) {
      int total = 0;
      for (var stat in detail.stats!) {
        total += stat.baseStat!;
      }
      return total;
    }

    Widget totalValue(PokemonDetailModel evo) {
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
              getTotalValue(evo).toString(),
              style: regular.black.semiBold,
            )
          ],
        ),
      );
    }

    Widget toggler() {
      return Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: toggles.map((toggle) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  this.currentType = toggle;
                });
              },
              child: Container(
                margin: EdgeInsets.only(
                  right: 6
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: currentType == toggle ? 4 : 3
                ),
                decoration: BoxDecoration(
                  color: currentType == toggle ? bgColor : whiteColor,
                  borderRadius: BorderRadius.circular(50),
                  border: currentType == toggle ? null : Border.all(
                    color: greyColor.withOpacity(0.7)
                  )
                ),
                child: Text(
                  capitalize(toggle),
                  style: currentType == toggle ? 
                    regular.white.semiBold : 
                    regular.semiBold.copyWith(
                      color: greyColor.withOpacity(0.7)
                    ),
                ),
              ),
            );
          }).toList(),
        ),
      );
    }

    Widget pokeEvoTop(PokemonDetailModel evo, int index) {
      return Container(
        margin: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 24
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$index. "+capitalize(evo.name!),
              style: base.semiBold.copyWith(
                color: bgColor
              ),
            ),
            SizedBox(height: 12),
            Row(
              children: evo.types!.map((type) {
                return Container(
                  margin: EdgeInsets.only(right: 4),
                  child: PokemonType(
                    type: type.type!.name!
                  )
                );
              }).toList(),
            )
          ],
        ),
      );
    }

    Widget arrowSlider(String type, Function() onPress) {
      return Positioned(
        right: type == 'right' ? 10 : null,
        left: type == 'left' ? 10 : null,
        top: 0,
        bottom: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                type == 'right' ? Icons.arrow_forward : Icons.arrow_back,
                size: 30, color: bgColor
              ),
              onPressed: onPress,
            ),
          ],
        ),
      );
    }

    Widget pokeRenderer(String image) {
      return Container(
        width: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(image)
          )
        ),
      );
    }

    Widget carousel(PokemonDetailModel evo, int index) {
      return Stack(
        children: [
          CarouselSlider(
            carouselController: controllers[index.toString()],
            items: getEvoSlide(evo).map((image) => pokeRenderer(image)).toList(),
            options: CarouselOptions(
              height: 150,
              viewportFraction: 1.0,
              initialPage: 0,
            ),
          ),
          arrowSlider('left', () {
            controllers[index.toString()]!.previousPage(
              duration: Duration(
                milliseconds: 800,
              ),
              curve: Curves.ease
            );
          }),
          arrowSlider('right', () {
            controllers[index.toString()]!.nextPage(
              duration: Duration(
                milliseconds: 800,
              ),
              curve: Curves.ease
            );
          }),
        ],
      );
    }

    Widget baseStats(PokemonDetailModel evo) {
      return Container(
        margin: EdgeInsets.only(
          top: 12,
          left: 24,
          right: 24
        ),
        child: Column(
          children: [
            BaseStatIndicator(detail: evo),
            totalValue(evo)
          ],
        )
      );
    }

    int index = 0;
    Widget evoRender(PokemonDetailModel evo) {
      index++;
      return Container(
        margin: EdgeInsets.only(
          bottom: 24
        ),
        child: Column(
          children: [
            pokeEvoTop(evo, index),
            carousel(evo, index),
            baseStats(evo)
          ],
        ),
      );
    }

    return Container(
      child: Column(
        children: [
          toggler(),
          Column(
            children: widget.detail.evolutions!.map((evo) {
              return evoRender(evo);
            }).toList(),
          ),
        ]
      ),
    );
  }
}
