import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/other_models/dream_world_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/other_models/home_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/other_models/official_artwork_model.dart';
import 'package:flutterpokemon/models/get_pokemon_detail_models/sprite_models/other_models/showdown_model.dart';

class OtherModel {
  late DreamWorldModel dreamWorld;
  late HomeModel home;
  late OfficialArtworkModel officialArtwork;
  late ShowdownModel showdown;

  OtherModel.fromJson(Map<String, dynamic> json) {
    this.dreamWorld = DreamWorldModel.fromJson(json['dream_world']);
    this.home = HomeModel.fromJson(json['home']);
    this.officialArtwork = OfficialArtworkModel.fromJson(json['official-artwork']);
    this.showdown = ShowdownModel.fromJson(json['showdown']);
  }

  Map<String, dynamic> toJson() {
    return {
      "dream_world": this.dreamWorld.toJson(),
      "home": this.home.toJson(),
      "official_artwork": this.officialArtwork.toJson(),
      "showdown": this.showdown.toJson(),
    };
  }
}