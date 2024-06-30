import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterpokemon/models/get_all_pokemon_models/pokemon_model.dart';
import 'package:flutterpokemon/services/pokemon_services.dart';

part '../states/get_pokemon_state.dart';

class GetPokemonCubit extends Cubit<GetPokemonState> {
  GetPokemonCubit() : super(GetPokemonInitial());

  void setCount(int value) {
    emit(GetPokemonLoading(value));
  }

  void setExtendCount(PokemonModel pokemon, int extendCount) {
    emit(GetPokemonExtendsLoading(pokemon, extendCount));
  }

  void getAllPokemon(BuildContext context) async {
    emit(GetPokemonLoading(0));
    PokemonModel? pokemon = await PokemonServices(context).getAllPokemon();
    if (pokemon != null) {
      emit(GetPokemonSuccess(pokemon));
    }
    if (pokemon == null) {
      emit(GetPokemonFailed("Failed to get pokemon data"));
    }
  }

  void extend(BuildContext context, String type, PokemonModel currentPokemon) async {
    emit(GetPokemonExtendsLoading(currentPokemon, 0));
    PokemonModel? pokemon = await PokemonServices(context).getAllPokemon(
      actionUrl: currentPokemon.next,
      currentPokemon: currentPokemon,
      type: "extend"
    );
    if (pokemon != null) {
      currentPokemon.updateValues(pokemon);
      emit(GetPokemonSuccess(currentPokemon));
    }
    if (pokemon == null) {
      emit(GetPokemonExtendFailed(currentPokemon));
    }
  }
}
