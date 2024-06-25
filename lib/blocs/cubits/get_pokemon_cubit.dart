import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '../states/get_pokemon_state.dart';

class GetPokemonCubit extends Cubit<GetPokemonState> {
  GetPokemonCubit() : super(GetPokemonInitial());
}
