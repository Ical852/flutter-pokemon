import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/models/get_pokemon_color_models/language_model.dart';

class NameModel {
  late String? name;
  late LanguageModel? language;

  NameModel.fromJson(Map<String, dynamic> json) {
    this.name = nullChecker(json['name'], json['name']);
    this.language = nullChecker(json['language'], LanguageModel.fromJson(json['language']));
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "language": this.language?.toJson(),
    };
  }
}