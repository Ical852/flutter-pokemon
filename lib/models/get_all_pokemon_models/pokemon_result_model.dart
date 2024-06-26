import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_color_models/pokemon_color_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';

class PokemonResultModel {
  late String? name, url;
  late PokemonDetailModel detail;
  late PokemonColorModel color;

  PokemonResultModel.fromJson(Map<String, dynamic> json) {
    this.name = nullChecker(json['name']);
    this.url = nullChecker(json['url']);
  }

  void setPokemonDetail(PokemonDetailModel detail) {
    this.detail = detail;
  }

  void setPokemonColor(PokemonColorModel color) {
    this.color = color;
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url, "detail": this.detail.toJson(), "color": this.color.toJson()};
  }
}
