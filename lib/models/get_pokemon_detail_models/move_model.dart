import 'package:flutterpokemon/functions/global_func.dart';

class MoveModel {
  late MoveDetailModel? move;

  MoveModel.fromJson(Map<String, dynamic> json) {
    this.move = isNotNull(json['move']) ? MoveDetailModel.fromJson(json['move']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "move": this.move?.toJson()
    };
  }
}

class MoveDetailModel {
  late String? name, url;

  MoveDetailModel.fromJson(Map<String, dynamic> json) {
    this.name = nullChecker(json['name']);
    this.url = nullChecker(json['url']);
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url};
  }
}
