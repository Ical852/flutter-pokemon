import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_color_models/name_model.dart';
import 'package:flutterpokemon/models/get_pokemon_color_models/species_model.dart';

class PokemonColorModel {
  late int? id;
  late String? name;
  late List<NameModel>? names;
  late List<SpeciesModel>? pokemonSpecies;

  PokemonColorModel.fromJson(Map<String, dynamic> json) {
    this.id = nullChecker(json['id'], json['id']);
    this.name = nullChecker(json['name'], json['name']);
    this.names = nullChecker(json['names'], json['names']
      .map<NameModel>((result) => NameModel.fromJson(result))
      .toList());
    this.pokemonSpecies = nullChecker(json['pokemon_species'], json['pokemon_species']
      .map<SpeciesModel>((result) => SpeciesModel.fromJson(result))
      .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "names": this.names?.map((result) => result.toJson()).toList(),
      "pokemon_species": this.pokemonSpecies?.map((result) => result.toJson()).toList(),
    };
  }
}