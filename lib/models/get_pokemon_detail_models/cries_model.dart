import 'package:flutterpokemon/functions/global_func.dart';

class CriesModel {
  late String? latest, legacy;

  CriesModel.fromJson(Map<String, dynamic> json) {
    this.latest = nullChecker(json['latest']);
    this.legacy = nullChecker(json['legacy']);
  }

  Map<String, dynamic> toJson() {
    return {
      "latest": this.latest,
      "legacy": this.legacy,
    };
  }
}
