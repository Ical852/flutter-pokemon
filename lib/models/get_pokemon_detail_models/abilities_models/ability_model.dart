import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/abilities_models/ability_detail_model.dart';

class AbilityModel {
  late AbilityDetailModel? ability;
  late bool? isHidden;
  late int? slot;

  AbilityModel.fromJson(Map<String, dynamic> json) {
    this.ability = nullChecker(json['ability'], AbilityDetailModel.fromJson(json['ability']));
    this.isHidden = nullChecker(json['is_hidden'], json['is_hidden']);
    this.slot = nullChecker(json['slot'], json['slot']);
  }

  Map<String, dynamic> toJson() {
    return {
      "ability": this.ability?.toJson(),
      "is_hidden": this.isHidden,
      "slot": this.slot
    };
  }
}
