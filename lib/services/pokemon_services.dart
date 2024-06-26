import 'dart:convert';

import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_model.dart';
import 'package:flutterpokemon/models/get_pokemon_color_models/pokemon_color_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';
import 'package:flutterpokemon/shared/constants.dart';
import 'package:http/http.dart' as http;

class PokemonServices {
  Future<PokemonModel?> getAllPokemon({
    String? actionUrl,
  }) async {
    var url = baseUrl + 'pokemon';
    if (actionUrl != null) {
      url = actionUrl;
    }
    var response = await http.get(Uri.parse(url));

    if (response.body.isEmpty) return null;
    var decoded = jsonDecode(response.body);

    var pokemons = PokemonModel.fromJson(decoded);
    var results = pokemons.results;
    if (results != null) {
      for (int i = 0; i < results.length; i++) {
        if (results[i].url != null) {
          var getDetail = await getDetailPokemon(getUrl: results[i].url!);
          if (getDetail != null) {
            if (getDetail.id != null) {
              var getColor = await getPokemonColor(id: getDetail.id!);
              if (getColor != null) {
                results[i].setPokemonDetail(getDetail);
                results[i].setPokemonColor(getColor);

                print(results[i].toJson());
              }
            }
          }
        }
      }
    }

    return pokemons;
  }

  Future<PokemonDetailModel?> getDetailPokemon({
    required String getUrl,
  }) async {
    var response = await http.get(Uri.parse(getUrl));

    if (response.body.isEmpty) return null;
    var decoded = jsonDecode(response.body);

    return PokemonDetailModel.fromJson(decoded);
  }

  Future<PokemonColorModel?> getPokemonColor({
    required int id,
  }) async {
    var url = baseUrl + 'pokemon-color/' + id.toString();
    var response = await http.get(Uri.parse(url));

    if (response.body.isEmpty) return null;
    var decoded = jsonDecode(response.body);

    return PokemonColorModel.fromJson(decoded);
  }
}