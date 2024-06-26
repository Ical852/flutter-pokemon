part of '../cubits/get_pokemon_cubit.dart';

sealed class GetPokemonState extends Equatable {
  const GetPokemonState();

  @override
  List<Object> get props => [];
}

final class GetPokemonInitial extends GetPokemonState {}

final class GetPokemonLoading extends GetPokemonState {}

final class GetPokemonExtendsLoading extends GetPokemonState {
  final PokemonModel pokemon;

  GetPokemonExtendsLoading(this.pokemon);

  @override
  List<Object> get props => [pokemon];
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
