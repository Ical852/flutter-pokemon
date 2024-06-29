import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_evolution_models/chain_models.dart/chain_model.dart';

class GetPokemonEvolutionModel {
  late int? id;
  late ChainModel? chain;
  late dynamic babyTriggerItem = null;

  GetPokemonEvolutionModel.fromJson(Map<String, dynamic> json) {
    this.id = nullChecker(json['id']);
    this.chain =
        isNotNull(json['chain']) ? ChainModel.fromJson(json['chain']) : null;
    this.babyTriggerItem = nullChecker(json['baby_trigger_item']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "chain": this.chain?.toJson(),
      "baby_trigger_item": this.babyTriggerItem
    };
  }
}
