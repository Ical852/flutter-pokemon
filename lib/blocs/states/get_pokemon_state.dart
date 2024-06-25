part of '../cubits/get_pokemon_cubit.dart';

sealed class GetPokemonState extends Equatable {
  const GetPokemonState();

  @override
  List<Object> get props => [];
}

final class GetPokemonInitial extends GetPokemonState {}

final class GetPokemonLoading extends GetPokemonState {}

final class GetPokemonSuccess extends GetPokemonState {}

final class GetPokemonFailed extends GetPokemonState {}
