import 'package:flutterpokemon/models/get_pokemon_detail_models/pokemon_detail_model.dart';

class SavedEvolutionModel {
  late List<PokemonDetailModel> evolutions = [];
  late String evolveUrl = "";

  SavedEvolutionModel.init(
      List<PokemonDetailModel> evolutions, String evolveUrl) {
    this.evolutions = evolutions;
    this.evolveUrl = evolveUrl;
  }
}
