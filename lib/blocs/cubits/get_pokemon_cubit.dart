import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_model.dart';
import 'package:flutterpokemon/services/pokemon_services.dart';

part '../states/get_pokemon_state.dart';

class GetPokemonCubit extends Cubit<GetPokemonState> {
  GetPokemonCubit() : super(GetPokemonInitial());

  void getAllPokemon() async {
    emit(GetPokemonLoading());
    PokemonModel? pokemon = await PokemonServices().getAllPokemon();
    if (pokemon != null) {
      emit(GetPokemonSuccess(pokemon));
    }
    if (pokemon == null) {
      emit(GetPokemonFailed("Failed to get pokemon data"));
    }
  }

  void extend(BuildContext context) async {
    var state = context.read<GetPokemonCubit>().state;
    PokemonModel? currentPokemon;
    if (state is GetPokemonSuccess) {
      currentPokemon = state.pokemon;
      emit(GetPokemonExtendsLoading());
      PokemonModel? pokemon = await PokemonServices().getAllPokemon(actionUrl: currentPokemon.next);
      if (pokemon != null) {
        currentPokemon.updateValues(pokemon);
        emit(GetPokemonSuccess(currentPokemon));
      }
      if (pokemon == null) {
        emit(GetPokemonFailed("Failed to extends pokemon data"));
      }
    }
  }
}
