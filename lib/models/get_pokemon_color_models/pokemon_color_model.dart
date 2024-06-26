import 'package:flutterpokemon/models/get_pokemon_color_models/name_model.dart';
import 'package:flutterpokemon/models/get_pokemon_color_models/species_model.dart';

class PokemonColorModel {
  late int id;
  late String name;
  late List<NameModel> names;
  late List<SpeciesModel> pokemonSpecies;

  PokemonColorModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.names = json['names']
        .map<NameModel>(
            (result) => NameModel.fromJson(result))
        .toList();
    this.pokemonSpecies = json['pokemon_species']
        .map<SpeciesModel>((result) => SpeciesModel.fromJson(result))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "names": this.names.map((result) => result.toJson()).toList(),
      "pokemon_species": this.pokemonSpecies.map((result) => result.toJson()).toList(),
    };
  }
}