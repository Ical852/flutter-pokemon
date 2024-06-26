import 'package:flutterpokemon/functions/global_func.dart';

class OfficialArtworkModel {
  late String? frontDefault, frontShiny;

  OfficialArtworkModel.fromJson(Map<String, dynamic> json) {
    this.frontDefault = nullChecker(json['front_default']);
    this.frontShiny = nullChecker(json['front_shiny']);
  }

  Map<String, dynamic> toJson() {
    return {
      "front_default": this.frontDefault,
      "front_shiny": this.frontShiny
    };
}
}