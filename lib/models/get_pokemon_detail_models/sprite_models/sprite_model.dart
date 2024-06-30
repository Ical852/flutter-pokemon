import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/other_models/other_model.dart';

class SpriteModel {
  late String? 
    backDefault,
    backFemale,
    backShiny,
    backShinyFemale,
    frontDefault,
    frontFemale,
    frontShiny,
    frontShinyFemale;
  late OtherModel? other;

  SpriteModel.fromJson(Map<String, dynamic> json) {
    this.backDefault = nullChecker(json['back_default']);
    this.backFemale = nullChecker(json['back_female']);
    this.backShiny = nullChecker(json['back_shiny']);
    this.backShinyFemale = nullChecker(json['back_shiny_female']);
    this.frontDefault = nullChecker(json['front_default']);
    this.frontFemale = nullChecker(json['front_female']);
    this.frontShiny = nullChecker(json['front_shiny']);
    this.frontShinyFemale = nullChecker(json['front_shiny_female']);
    this.other = isNotNull(json['other']) ? OtherModel.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "back_default": this.backDefault,
      "back_female": this.backFemale,
      "back_shiny": this.backShiny,
      "back_shiny_female": this.backShinyFemale,
      "front_default": this.frontDefault,
      "front_female": this.frontFemale,
      "front_shiny": this.frontShiny,
      "front_shiny_female": this.frontShinyFemale,
      "other": this.other?.toJson()
    };
  }
}