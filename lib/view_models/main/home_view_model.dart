import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpokemon/blocs/cubits/get_pokemon_cubit.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_model.dart';

class HomeViewModel {
  late BuildContext context;

  HomeViewModel(BuildContext context) {
    this.context = context;
  }

  void getAllPokemons() {
    context.read<GetPokemonCubit>().getAllPokemon();
  }

  void extendPokemons(PokemonModel pokemon) {
    context.read<GetPokemonCubit>().extend(context, pokemon);
  }
}