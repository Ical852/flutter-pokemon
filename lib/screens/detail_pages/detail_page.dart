// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_result_model.dart';
import 'package:flutterpokemon/screens/detail_pages/sections/detail_description.dart';
import 'package:flutterpokemon/screens/detail_pages/sections/detail_header.dart';
import 'package:flutterpokemon/screens/detail_pages/sections/detail_pokemon.dart';
import 'package:flutterpokemon/screens/detail_pages/tabs/about.dart';
import 'package:flutterpokemon/screens/detail_pages/tabs/baseStats.dart';
import 'package:flutterpokemon/screens/detail_pages/tabs/evolution.dart';
import 'package:flutterpokemon/screens/detail_pages/tabs/moves.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/widgets/detail/tabs_item.dart';

class DetailPage extends StatefulWidget {
  PokemonResultModel pokemon;
  DetailPage(this.pokemon);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late CarouselController _controller;
  String currentTab = "About";
  String type = "gifs";
  int currentSlide = 0;

  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> tabpages = ["About", "Base Stats", "Evolution", "Moves"];
    final detail = this.widget.pokemon.detail;
    final bgColor = detail!.bgColor;
    final gifList = getGifList(detail.sprites!.other!.showdown!);
    final picList = getPicList(detail.sprites!);
    final pokeList = this.type == "gifs" ? gifList : picList;

    Widget header() {
      return DetailHeader(
        onTap: (){
          var newState = this.type == "gifs" ? "pics" : "gifs";
          setState(() {
            this.type = newState;
          });
        },
      );
    }

    Widget description() {
      return DetailDescription(detail: detail);
    }

    void onSlide(int index, CarouselPageChangedReason reason){
      setState(() {
        this.currentSlide = index;
      });
    }

    Widget pokemonImage() {
      return DetailPokemon(
        controller: _controller,
        pokeList: pokeList,
        currentSlide: currentSlide,
        bgColor: bgColor!,
        onSlide: onSlide,
      );
    }

    Widget tabs() {
      return Container(
        margin: EdgeInsets.only(top: 48),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: greyColor.withOpacity(0.5)
              )
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: tabpages.map((tab) {
              return TabsItem(
                text: tab,
                currentTab: currentTab,
                onPress: () {
                  setState(() {
                    currentTab = tab;
                  });
                },
              );
            }).toList(),
          ),
        ),
      );
    }

    Widget tabContent() {
      switch (this.currentTab) {
        case "About":
          return AboutContent(
            detail: detail,
          );
        case "Base Stats":
          return BaseStatsContent(
            detail: detail,
          );
        case "Evolution":
          return EvolutionContent(
            detail: detail,
          );
        case "Moves":
          return MovesContent(
            detail: detail,
          );
        default:
          return AboutContent(
            detail: detail,
          );
      }
    }

    Widget detailData() {
      return Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          margin: EdgeInsets.only(top: 380),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24)
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              tabs(),
              SizedBox(
                height: 20,
              ),
              tabContent(),
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
          color: bgColor,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                header(),
                description(),
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
