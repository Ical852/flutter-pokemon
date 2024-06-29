import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_result_model.dart';
import 'package:flutterpokemon/screens/detail_pages/tabs/about.dart';
import 'package:flutterpokemon/screens/detail_pages/tabs/baseStats.dart';
import 'package:flutterpokemon/screens/detail_pages/tabs/evolution.dart';
import 'package:flutterpokemon/screens/detail_pages/tabs/moves.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';
import 'package:flutterpokemon/widgets/detail/detail_image.dart';
import 'package:flutterpokemon/widgets/detail/tabs_item.dart';
import 'package:flutterpokemon/widgets/main/pokemon_type.dart';

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
      return Container(
        margin: EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ic_chevron_left.png"))),
              ),
            ),
            GestureDetector(
              onTap: () {
                var newState = this.type == "gifs" ? "pics" : "gifs";
                setState(() {
                  this.type = newState;
                });
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ic_change.png"))),
              ),
            ),
          ],
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(top: 72, left: 24, right: 24),
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
                      .map((type) => PokemonType(
                            big: true,
                            type: type.type!.name!,
                          ))
                      .toList(),
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

    Widget indicator(int index) {
      bool isCurrent = index == this.currentSlide;

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        width: isCurrent ? 24 : 8,
        height: 8,
        decoration: BoxDecoration(
            color: isCurrent ? bgColor : greyColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(4)),
      );
    }

    Widget arrowSlider(String type, Function() onPress) {
      return Positioned(
        right: type == 'right' ? 10 : null,
        left: type == 'left' ? 10 : null,
        top: 0,
        bottom: 0,
        child: IconButton(
          icon: Icon(type == 'right' ? Icons.arrow_forward : Icons.arrow_back,
              size: 30, color: Colors.white),
          onPressed: onPress,
        ),
      );
    }

    int index = -1;
    Widget carousel() {
      return CarouselSlider(
        carouselController: _controller,
        items: pokeList.map((image) => DetailImage(image: image)).toList(),
        options: CarouselOptions(
          viewportFraction: 1.0,
          initialPage: 0,
          onPageChanged: (index, reason) {
            setState(() {
              this.currentSlide = index;
            });
          },
        ),
      );
    }

    Widget pokemonIndicator() {
      return Container(
        margin: EdgeInsets.only(top: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pokeList.map((tes) {
            index++;
            return indicator(index);
          }).toList(),
        ),
      );
    }

    Widget pokemonImage() {
      return Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 180),
              child: Stack(
                children: [
                  carousel(),
                  arrowSlider('left', () {
                    _controller.previousPage(
                        duration: Duration(
                          milliseconds: 800,
                        ),
                        curve: Curves.ease);
                  }),
                  arrowSlider('right', () {
                    _controller.nextPage(
                        duration: Duration(
                          milliseconds: 800,
                        ),
                        curve: Curves.ease);
                  }),
                ],
              ),
            ),
            pokemonIndicator()
          ],
        ),
      );
    }

    Widget tabs() {
      return Container(
        margin: EdgeInsets.only(top: 48),
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: greyColor.withOpacity(0.5)))),
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
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
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
