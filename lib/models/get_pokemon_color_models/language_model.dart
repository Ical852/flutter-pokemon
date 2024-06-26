import 'package:flutterpokemon/functions/global_func.dart';

class LanguageModel {
  late String? name, url;

  LanguageModel.fromJson(Map<String, dynamic> json) {
    this.name = nullChecker(json['name']);
    this.url = nullChecker(json['url']);
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url};
  }
}