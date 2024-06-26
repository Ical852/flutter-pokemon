import 'dart:ffi';

import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_result_model.dart';

class PokemonModel {
  late Int count;
  late String? next, previous;
  late List<PokemonResultModel> results;

  PokemonModel.fromJson(Map<String, dynamic> json) {
    this.count = json['count'];
    this.next = json['next'];
    this.previous = json['previous'];
    this.results = json['results']
        .map<PokemonResultModel>(
            (result) => PokemonResultModel.fromJson(result))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "count": this.count,
      "next": this.next,
      "previous": this.previous,
      "results": this.results.map((result) => result.toJson()).toList()
    };
  }
}
