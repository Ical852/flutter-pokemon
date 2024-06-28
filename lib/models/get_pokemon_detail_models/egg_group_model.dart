import 'package:flutterpokemon/functions/global_func.dart';

class EggGroupModel {
  late int? id;
  late String? name;

  EggGroupModel.fromJson(Map<String, dynamic> json) {
    this.id = nullChecker(json['id']);
    this.name = nullChecker(json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
    };
  }
}
