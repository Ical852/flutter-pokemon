import 'package:flutterpokemon/functions/global_func.dart';

class HomeModel {
  late String? 
      frontDefault,
      frontFemale,
      frontShiny,
      frontShinyFemale;

  HomeModel.fromJson(Map<String, dynamic> json) {
    this.frontDefault = nullChecker(json['front_default'], json['front_default']);
    this.frontFemale = nullChecker(json['front_female'], json['front_female']);
    this.frontShiny = nullChecker(json['front_shiny'], json['front_shiny']);
    this.frontShinyFemale = nullChecker(json['front_shiny_female'], json['front_shiny_female']);
  }

  Map<String, dynamic> toJson() {
    return {
      "front_default": this.frontDefault,
      "front_female": this.frontFemale,
      "front_shiny": this.frontShiny,
      "front_shiny_female": this.frontShinyFemale,
    };
  }
}
