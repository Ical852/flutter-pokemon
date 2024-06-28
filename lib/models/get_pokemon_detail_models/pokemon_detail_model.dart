import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/abilities_models/ability_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/cries_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/egg_group_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/forms_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/move_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/species_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/sprite_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/stats_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/type_model.dart';
import 'package:flutterpokemon/shared/constants.dart';

class PokemonDetailModel {
  late int? id, height, order, baseExperience, weight;
  late bool? isDefault;
  late String? name, locationAreaEncounters;
  late CriesModel? cries;
  late SpeciesModel? species;
  late SpriteModel? sprites;
  late EggGroupModel? group = null;
  late List<AbilityModel>? abilities;
  late List<FormsModel>? forms;
  late List<MoveModel>? moves;
  late List<StatsModel>? stats;
  late List<TypeModel>? types;
  late Color? bgColor;

  PokemonDetailModel.fromJson(Map<String, dynamic> json) {
    this.id = nullChecker(json['id']);
    this.height = nullChecker(json['height']);
    this.weight = nullChecker(json['weight']);
    this.order = nullChecker(json['order']);
    this.baseExperience = nullChecker(json['base_experience']);

    this.isDefault = nullChecker(json['is_default']);

    this.name = nullChecker(json['name']);
    this.locationAreaEncounters = nullChecker(json['location_area_encounters']);

    this.cries =
        isNotNull(json['cries']) ? CriesModel.fromJson(json['cries']) : null;
    this.species = isNotNull(json['species'])
        ? SpeciesModel.fromJson(json['species'])
        : null;
    this.sprites = isNotNull(json['sprites'])
        ? SpriteModel.fromJson(json['sprites'])
        : null;

    this.abilities = isNotNull(json['abilities'])
        ? json['abilities']
            .map<AbilityModel>((result) => AbilityModel.fromJson(result))
            .toList()
        : null;
    this.forms = isNotNull(json['forms'])
        ? json['forms']
            .map<FormsModel>((result) => FormsModel.fromJson(result))
            .toList()
        : null;
    this.moves = isNotNull(json['moves'])
        ? json['moves']
            .map<MoveModel>((result) => MoveModel.fromJson(result))
            .toList()
        : null;
    this.stats = isNotNull(json['stats'])
        ? json['stats']
            .map<StatsModel>((result) => StatsModel.fromJson(result))
            .toList()
        : null;
    this.types = isNotNull(
      json['types'],
    )
        ? json['types']
            .map<TypeModel>((result) => TypeModel.fromJson(result))
            .toList()
        : null;

    this.bgColor = getPokeColor(types![0].type!.name!);
  }

  void setPokemonGroup(EggGroupModel group) {
    this.group = group;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "height": this.height,
      "weight": this.weight,
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
