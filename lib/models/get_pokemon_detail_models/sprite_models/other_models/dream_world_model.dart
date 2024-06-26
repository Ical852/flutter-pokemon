import 'package:flutterpokemon/functions/global_func.dart';

class DreamWorldModel {
  late String? frontDefault, frontFemale;

  DreamWorldModel.fromJson(Map<String, dynamic> json) {
    this.frontDefault = nullChecker(json['front_default'], json['front_default']);
    this.frontFemale = nullChecker(json['front_female'], json['front_female']);
  }

  Map<String, dynamic> toJson() {
    return {
      "front_default": this.frontDefault,
      "front_female": this.frontFemale
    };
  }
}