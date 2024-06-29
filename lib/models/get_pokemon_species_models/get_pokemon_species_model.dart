import 'package:flutterpokemon/functions/global_func.dart';

class GetPokemonSpeciesModel {}

class EggGrouopsModel {
  late String? name, url;

  EggGrouopsModel.fromJson(Map<String, dynamic> json) {
    this.name = nullChecker(json['name']);
    this.url = nullChecker(json['url']);
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url};
  }
}

class EvolutionChainModel {
  late String? url;

  EvolutionChainModel.fromJson(Map<String, dynamic> json) {
    this.url = nullChecker(json['url']);
  }

  Map<String, dynamic> toJson() {
    return {"url": this.url};
  }
}
