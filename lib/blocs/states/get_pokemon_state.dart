part of '../cubits/get_pokemon_cubit.dart';

sealed class GetPokemonState extends Equatable {
  const GetPokemonState();

  @override
  List<Object> get props => [];
}

final class GetPokemonInitial extends GetPokemonState {}

final class GetPokemonLoading extends GetPokemonState {
  final int count;
  final List<SavedEvolutionModel> savedEvolves;

  GetPokemonLoading(this.count, this.savedEvolves);

  @override
  List<Object> get props => [count];
}

final class GetPokemonSuccess extends GetPokemonState {
  final PokemonModel pokemon;

  GetPokemonSuccess(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}

final class GetPokemonFailed extends GetPokemonState {
  final String error;

  const GetPokemonFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class GetPokemonExtendsLoading extends GetPokemonState {
  final PokemonModel pokemon;
  final int extendCount;
  final List<SavedEvolutionModel> savedEvolves;

  GetPokemonExtendsLoading(this.pokemon, this.extendCount, this.savedEvolves);

  @override
  List<Object> get props => [pokemon, extendCount];
}

final class GetPokemonExtendFailed extends GetPokemonState {
  final PokemonModel pokemon;

  GetPokemonExtendFailed(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}
