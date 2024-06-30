import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_evolution_models/chain_models.dart/evolve_models/evolve_to_model.dart';
import 'package:flutterpokemon/models/get_pokemon_evolution_models/chain_models.dart/evolve_models/species_model.dart';

class ChainModel {
  late bool? isBaby;
  late SpeciesModel? species;
  late List<EvolveToModel>? evolvesTo;

  ChainModel.fromJson(Map<String, dynamic> json) {
    this.isBaby = nullChecker(json['is_baby']);
    this.species = isNotNull(json['species'])
      ? SpeciesModel.fromJson(json['species'])
      : null;

    this.evolvesTo = isNotNull(json['evolves_to'])
      ? json['evolves_to']
          .map<EvolveToModel>((result) => EvolveToModel.fromJson(result))
          .toList()
      : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "is_baby": this.isBaby,
      "species": this.species?.toJson(),
      "evolves_to": this.evolvesTo?.map((result) => result.toJson()).toList(),
    };
  }
}
