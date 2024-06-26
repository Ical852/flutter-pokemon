import 'package:flutterpokemon/functions/global_func.dart';

class AbilityDetailModel {
  late String? name, url;

  AbilityDetailModel.fromJson(Map<String, dynamic> json) {
    this.name = nullChecker(json['name']);
    this.url = nullChecker(json['url']);
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url};
  }
}
