import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/other_models/dream_world_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/other_models/home_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/other_models/official_artwork_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/other_models/showdown_model.dart';

class OtherModel {
  late DreamWorldModel? dreamWorld;
  late HomeModel? home;
  late OfficialArtworkModel? officialArtwork;
  late ShowdownModel? showdown;

  OtherModel.fromJson(Map<String, dynamic> json) {
    this.dreamWorld = isNotNull(json['dream_world']) ? DreamWorldModel.fromJson(json['dream_world']) : null;
    this.home = isNotNull(json['home']) ? HomeModel.fromJson(json['home']) : null;
    this.officialArtwork = isNotNull(json['official-artwork']) ? OfficialArtworkModel.fromJson(json['official-artwork']) : null;
    this.showdown = isNotNull(json['showdown']) ? ShowdownModel.fromJson(json['showdown']) : null ;
  }

  Map<String, dynamic> toJson() {
    return {
      "dream_world": this.dreamWorld?.toJson(),
      "home": this.home?.toJson(),
      "official_artwork": this.officialArtwork?.toJson(),
      "showdown": this.showdown?.toJson(),
    };
  }
}