import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/abilities_models/ability_detail_model.dart';

class AbilityModel {
  late AbilityDetailModel? ability;
  late bool? isHidden;
  late int? slot;

  AbilityModel.fromJson(Map<String, dynamic> json) {
    this.ability = isNotNull(json['ability']) ? AbilityDetailModel.fromJson(json['ability']): null;
    this.isHidden = nullChecker(json['is_hidden']);
    this.slot = nullChecker(json['slot']);
  }

  Map<String, dynamic> toJson() {
    return {
      "ability": this.ability?.toJson(),
      "is_hidden": this.isHidden,
      "slot": this.slot
    };
  }
}
