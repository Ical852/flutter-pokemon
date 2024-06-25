import 'package:flutterpokemon/models/get_pokemon_detail_models/abilities_models/ability_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/cries_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/forms_model.dart';

class PokemonDetailModel {
  late List<AbilityModel> abilities;
  late int baseExperience;
  late CriesModel cries;
  late List<FormsModel> forms;
  late int height;
  late int id;
  late bool isDefault;
  late String locationAreaEncounters;
}
