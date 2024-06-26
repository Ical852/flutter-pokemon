import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_result_model.dart';

class PokemonModel {
  late int? count;
  late String? next, previous;
  late List<PokemonResultModel>? results;

  PokemonModel.fromJson(Map<String, dynamic> json) {
    this.count = nullChecker(json['count'], json['count']);
    this.next = nullChecker(json['next'], json['next']);
    this.previous = nullChecker(json['previous'], json['previous']);
    this.results = nullChecker(json['results'], json['results']
    .map<PokemonResultModel>(
        (result) => PokemonResultModel.fromJson(result))
    .toList());
  }

  void updateValues(PokemonModel pokemon) {
    if (this.count != null && pokemon.count != null) {
      this.count = this.count! + pokemon.count!;
    }

    if (this.next != null && this.previous != null && pokemon.next != null && pokemon.previous != null) {
      this.next = pokemon.next;
      this.previous = pokemon.previous;
    }

    if (this.results != null && pokemon.results != null) {
      if (this.results!.isNotEmpty && pokemon.results!.isNotEmpty){
        this.results = [...this.results!, ...pokemon.results!];
      }
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "count": this.count,
      "next": this.next,
      "previous": this.previous,
      "results": this.results?.map((result) => result.toJson()).toList()
    };
  }
}
