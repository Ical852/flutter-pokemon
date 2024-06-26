import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/abilities_models/ability_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/cries_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/forms_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/move_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/species_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/sprite_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/stats_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/type_model.dart';

class PokemonDetailModel {
  late int? id, height, order, baseExperience;
  late bool? isDefault;
  late String? name, locationAreaEncounters;
  late CriesModel? cries;
  late SpeciesModel? species;
  late SpriteModel? sprites;
  late List<AbilityModel>? abilities;
  late List<FormsModel>? forms;
  late List<MoveModel>? moves;
  late List<StatsModel>? stats;
  late List<TypeModel>? types;

  PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    this.id = nullChecker(json['id'], json['id']);
    this.height = nullChecker(json['height'], json['height']);
    this.order = nullChecker(json['order'], json['order']);
    this.baseExperience = nullChecker(json['base_experience'], json['base_experience']);

    this.isDefault = nullChecker(json['is_default'], json['is_default']);

    this.name = nullChecker(json['name'], json['name']);
    this.locationAreaEncounters = nullChecker(json['location_area_encounters'], json['location_area_encounters']);

    this.cries = nullChecker(json['cries'], CriesModel.fromJson(json['cries']));
    this.species = nullChecker(json['species'], SpeciesModel.fromJson(json['species']));
    this.sprites = nullChecker(json['sprites'], SpriteModel.fromJson(json['sprites']));

    this.abilities = nullChecker(json['abilities'], json['abilities']
            .map<AbilityModel>((result) => AbilityModel.fromJson(result))
            .toList());
    this.forms = nullChecker(json['forms'], json['forms']
            .map<FormsModel>((result) => FormsModel.fromJson(result))
            .toList());
    this.moves = nullChecker(json['moves'], json['moves']
            .map<MoveModel>((result) => MoveModel.fromJson(result))
            .toList());
    this.stats = nullChecker(json['stats'], json['stats']
            .map<AbilityModel>((result) => AbilityModel.fromJson(result))
            .toList());
    this.types = nullChecker(json['types'], json['types']
            .map<AbilityModel>((result) => AbilityModel.fromJson(result))
            .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "height": this.height,
      "order": this.order,
      "base_experience": this.baseExperience,
      "is_default": this.isDefault,
      "name": this.name,
      "location_area_encounters": this.locationAreaEncounters,
      "cries": this.cries?.toJson(),
      "species": this.species?.toJson(),
      "sprites": this.sprites?.toJson(),
      "abilities": this.abilities?.map((result) => result.toJson()).toList(),
      "forms": this.forms?.map((result) => result.toJson()).toList(),
      "moves": this.moves?.map((result) => result.toJson()).toList(),
      "stats": this.stats?.map((result) => result.toJson()).toList(),
      "types": this.types?.map((result) => result.toJson()).toList(),
    };
  }
}
