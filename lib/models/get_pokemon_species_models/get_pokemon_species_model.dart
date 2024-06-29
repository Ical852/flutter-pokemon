import 'package:flutterpokemon/functions/global_func.dart';

class GetPokemonSpeciesModel {
  late EvolutionChainModel? evolutionChain;

  GetPokemonSpeciesModel.fromJson(Map<String, dynamic> json){
    this.evolutionChain = isNotNull(json['evolution_chain']) ? EvolutionChainModel.fromJson(json['evolution_chain']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "evolution_chain": this.evolutionChain?.toJson()
    };
  }
}

class EvolutionChainModel {
  late String? url;

  EvolutionChainModel.fromJson(Map<String, dynamic> json) {
    this.url = nullChecker(json['url']);
  }

  Map<String, dynamic> toJson() {
    return {"url": this.url};
  }
}
