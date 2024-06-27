import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_result_model.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';
import 'package:flutterpokemon/widgets/detail/detail_image.dart';
import 'package:flutterpokemon/widgets/detail/tabs_item.dart';

class DetailPage extends StatefulWidget {
  PokemonResultModel pokemon;
  DetailPage(this.pokemon);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final List<String> tabpages = ["About", "Base Stats", "Evolution", "Moves"];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = getWH(context, "height");
    final double screenWidth = getWH(context, "width");
    String currentTab = "About";

    void setNewCurrent(String params) {}

    Widget pokemonImage() {
      return Align(
        alignment: Alignment.topCenter,
        child: DetailImage(
            image: this
                .widget
                .pokemon
                .detail!
                .sprites!
                .other!
                .showdown!
                .frontDefault!,
            height: screenHeight,
            width: screenWidth),
      );
    }

    Widget tabs() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: tabpages
              .map((tab) => TabsItem(
                    text: tab,
                    currentTab: currentTab,
                    onPress: () {
                      setState(() {
                        currentTab = tab;
                      });
                    },
                  ))
              .toList(),
        ),
      );
    }

    Widget detailData() {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          margin: EdgeInsets.only(top: screenHeight * 0.4),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          child: Column(
            children: [
              tabs(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: this.widget.pokemon.detail!.bgColor,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                detailData(),
                pokemonImage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
