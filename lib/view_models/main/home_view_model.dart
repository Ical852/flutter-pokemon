import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpokemon/blocs/cubits/get_pokemon_cubit.dart';

class HomeViewModel {
  late BuildContext context;

  HomeViewModel(BuildContext context) {
    this.context = context;
  }

  void getAllPokemons() {
    context.read<GetPokemonCubit>().getAllPokemon();
  }

  void extendPokemons() {
    context.read<GetPokemonCubit>().extend(context);
  }
}