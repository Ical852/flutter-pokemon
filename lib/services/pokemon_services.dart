import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpokemon/blocs/cubits/get_pokemon_cubit.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_model.dart';
import 'package:flutterpokemon/models/get_pokemon_color_models/pokemon_color_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/egg_group_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:http/http.dart' as http;

class PokemonServices {
  late BuildContext context;

  PokemonServices(BuildContext context) {
    this.context = context;
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
      if (results != null) {
        for (int i = 0; i < results.length; i++) {
          if (results[i].url != null) {
            var getDetail = await getDetailPokemon(getUrl: results[i].url!);
            if (getDetail != null) {
              results[i].setPokemonDetail(getDetail);
              if (getDetail.id != null) {
                var getColor = await getPokemonColor(id: getDetail.id!);
                var getGroup = await getPokemonGrouop(id: getDetail.id!);
                if (getColor != null) {
                  results[i].setPokemonColor(getColor);
                }
                if (getGroup != null) {
                  results[i].detail!.setPokemonGroup(getGroup);
                }
              }

              if (type == 'extend') {
                context
                    .read<GetPokemonCubit>()
                    .setExtendCount(currentPokemon!, i);
              } else {
                context.read<GetPokemonCubit>().setCount(i);
              }
            }
          }
        }
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
}
