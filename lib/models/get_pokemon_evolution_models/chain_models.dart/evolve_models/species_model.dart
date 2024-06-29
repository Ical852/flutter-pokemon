import 'package:flutterpokemon/functions/global_func.dart';

class SpeciesModel {
  late String? name, url;

  SpeciesModel.fromJson(Map<String, dynamic> json) {
    this.name = nullChecker(json['name']);
    this.url = nullChecker(json['url']);
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url};
  }
}
