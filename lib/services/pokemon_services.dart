import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpokemon/blocs/cubits/get_pokemon_cubit.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_model.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_result_model.dart';
import 'package:flutterpokemon/models/get_pokemon_color_models/pokemon_color_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/egg_group_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';
import 'package:flutterpokemon/models/get_pokemon_evolution_models/get_pokemon_evolution_model.dart';
import 'package:flutterpokemon/models/get_pokemon_species_models/get_pokemon_species_model.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:http/http.dart' as http;

class PokemonServices {
  late BuildContext context;

  PokemonServices(BuildContext context) {
    this.context = context;
  }

  void updateCount(String type, PokemonModel? currentPokemon, int index) {
    if (type == 'extend') {
      context.read<GetPokemonCubit>().setExtendCount(currentPokemon!, index);
    } else {
      context.read<GetPokemonCubit>().setCount(index);
    }
  }

  List<PokemonDetailModel> setupEvolutions(
    GetPokemonEvolutionModel evolutions,
    List<PokemonResultModel> results
  ) {
    List<PokemonDetailModel> setupEvolves = [];

    var minFind = evolutions.chain?.species?.name!;
    var midSet = evolutions.chain?.evolvesTo;
    var midFind = null;
    var maxFind = null;

    if (midSet != null && midSet.isNotEmpty) {
      midFind = midSet.first.species?.name;

      var maxSet = midSet.first.evolvesTo;
      if (maxSet != null && maxSet.isNotEmpty) {
        maxFind = maxSet.first.species!.name;
      }
    }

    if (minFind != null) {
      try {
        PokemonResultModel? minFinded =
          results.firstWhere((find) => find.name == minFind);
        if (minFinded.name != null) {
          setupEvolves.add(minFinded.detail!);
        }
      } catch (e) {}
    }

    if (midFind != null) {
      try {
        PokemonResultModel? midFinded =
          results.firstWhere((find) => find.name == midFind);
        if (midFinded.name != null) {
          setupEvolves.add(midFinded.detail!);
        }
      } catch (e) {}
    }

    if (maxFind != null) {
      try {
        PokemonResultModel? maxFinded =
          results.firstWhere((find) => find.name == maxFind);
        if (maxFinded.name != null) {
          setupEvolves.add(maxFinded.detail!);
        }
      } catch (e) {}
    }

    return setupEvolves;
  }

  Future<PokemonModel?> getAllPokemon({
    String? actionUrl,
    PokemonModel? currentPokemon,
    String type = "normal",
  }) async {
    try {
      var url = baseUrl + 'pokemon';
      if (actionUrl != null) {
        url = actionUrl;
      }
      var response = await http.get(Uri.parse(url));

      if (response.statusCode != 200) return null;
      if (response.body.isEmpty) return null;
      var decoded = jsonDecode(response.body);

      var pokemons = PokemonModel.fromJson(decoded);
      var results = pokemons.results;

      if (results == null) return null;

      for (int i = 0; i < results.length; i++) {
        if (results[i].url == null) return null;

        var getDetail = await getDetailPokemon(getUrl: results[i].url!);
        if (getDetail == null) return null;
        results[i].setPokemonDetail(getDetail);
        if (getDetail.id == null) return null;

        var getColor = await getPokemonColor(id: getDetail.id!);
        if (getColor != null) {
          results[i].setPokemonColor(getColor);
        }

        var getGroup = await getPokemonGrouop(id: getDetail.id!);
        if (getGroup != null) {
          results[i].detail!.setPokemonGroup(getGroup);
        }

        var getSpecies = await getPokemonSpecies(id: getDetail.id!);
        if (getSpecies == null) return null;
        results[i].detail!.setSpeciesDetail(getSpecies);

        updateCount(type, currentPokemon, i);
      }

      for (int i = 0; i < results.length; i++) {
        var evolveUrl = results[i].detail!.speciesDetail!.evolutionChain!.url;
        var getEvolves = await getPokemonEvolutions(actionUrl: evolveUrl!);
        if (getEvolves == null) return null;
        try {
          var setupResult = type == 'extend'
            ? [...results, ...currentPokemon!.results!]
            : results;
          var evolutions = setupEvolutions(getEvolves, setupResult);
          results[i].detail!.setEvolutions(evolutions);
        } catch (e) {}
      }

      return pokemons;
    } catch (e) {
      return null;
    }
  }

  Future<PokemonDetailModel?> getDetailPokemon({
    required String getUrl,
  }) async {
    try {
      var response = await http.get(Uri.parse(getUrl));

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return PokemonDetailModel.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<PokemonColorModel?> getPokemonColor({
    required int id,
  }) async {
    try {
      var url = baseUrl + 'pokemon-color/' + id.toString();
      var response = await http.get(Uri.parse(url));

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return PokemonColorModel.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<EggGroupModel?> getPokemonGrouop({
    required int id,
  }) async {
    try {
      var url = baseUrl + 'egg-group/' + id.toString();
      var response = await http.get(Uri.parse(url));

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return EggGroupModel.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<GetPokemonSpeciesModel?> getPokemonSpecies({
    required int id,
  }) async {
    try {
      var url = baseUrl + 'pokemon-species/' + id.toString();
      var response = await http.get(Uri.parse(url));

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return GetPokemonSpeciesModel.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<GetPokemonEvolutionModel?> getPokemonEvolutions({
    required String actionUrl,
  }) async {
    try {
      var url = actionUrl;
      var response = await http.get(Uri.parse(url));

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return GetPokemonEvolutionModel.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }
}
