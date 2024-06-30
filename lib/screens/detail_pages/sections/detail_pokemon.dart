// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/widgets/detail/detail_image.dart';

class DetailPokemon extends StatelessWidget {
  CarouselController controller;
  List<dynamic> pokeList;
  int currentSlide;
  Color bgColor;
  Function(int, CarouselPageChangedReason) onSlide;
  DetailPokemon({
    super.key,
    required this.controller,
    required this.pokeList,
    required this.currentSlide,
    required this.bgColor,
    required this.onSlide,
  });

  @override
  Widget build(BuildContext context) {
    Widget indicator(int index) {
      bool isCurrent = index == currentSlide;

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        width: isCurrent ? 24 : 8,
        height: 8,
        decoration: BoxDecoration(
          color: isCurrent ? bgColor : greyColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(4)
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
                size: 30, color: Colors.white
              ),
              onPressed: onPress,
            ),
          ],
        ),
      );
    }

    Widget carousel() {
      return CarouselSlider(
        carouselController: controller,
        items: pokeList.map((image) => DetailImage(image: image)).toList(),
        options: CarouselOptions(
          height: 225,
          viewportFraction: 1.0,
          initialPage: 0,
          onPageChanged: onSlide,
        ),
      );
    }
    
    int index = -1;
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
                  controller.previousPage(
                    duration: Duration(
                      milliseconds: 800,
                    ),
                    curve: Curves.ease
                  );
                }),
                arrowSlider('right', () {
                  controller.nextPage(
                    duration: Duration(
                      milliseconds: 800,
                    ),
                    curve: Curves.ease
                  );
                }),
              ],
            ),
          ),
          pokemonIndicator()
        ],
      ),
    );
  }
}