import 'package:flutter/material.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/other_models/showdown_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/sprite_model.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:flutterpokemon/shared/text_styles.dart';

dynamic nullChecker(dynamic check) {
  if (check == null) return null;
  return check;
}

bool isNotNull(dynamic check) {
  return check != null;
}

Color getColorType(type) {
  if (type == 'danger') {
    return errorColor;
  } else if (type == 'info') {
    return infoColor;
  } else {
    return successColor;
  }
}

void showGLobalAlert(type, text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 2),
    content: Text(
      text,
      style: regular.white.bold,
      textAlign: TextAlign.center,
    ),
    backgroundColor: getColorType(type),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8)
      )
    ),
  ));
}

double getWH(BuildContext context, String type) {
  var size = MediaQuery.of(context).size;

  if (type == 'width') return size.width;
  return size.height;
}

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1); 
}

List<dynamic> getGifList(ShowdownModel show){
  var list = [];
  var setup = show.toJson();

  list.add(show.frontDefault);
  for (var keys in setup.keys) {
    if (setup[keys] != null && keys != 'frontDefault') {
      list.add(setup[keys]);
    }
  }

  return list;
}

List<dynamic> getPicList(SpriteModel sprites) {
  var list = [];
  var setup = sprites.toJson();

  list.add(sprites.frontDefault);
  for (var keys in setup.keys) {
    if (setup[keys] != null && keys != 'frontDefault' && keys != 'other') {
      list.add(setup[keys]);
    }
  }

  return list;
}
