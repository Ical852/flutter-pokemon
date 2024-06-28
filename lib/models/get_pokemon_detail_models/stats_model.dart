import 'package:flutterpokemon/functions/global_func.dart';

class StatsModel {
  late int? baseStat, effort;
  late StatsDetailModel? stat;

  StatsModel.fromJson(Map<String, dynamic> json) {
    this.baseStat = nullChecker(json['base_stat']);
    this.effort = nullChecker(json['effort']);
    this.stat = isNotNull(json['stat'])
        ? StatsDetailModel.fromJson(json['stat'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      "base_stat": this.baseStat,
      "effort": this.effort,
      "stat": this.stat?.toJson(),
    };
  }
}

class StatsDetailModel {
  late String? name, url;

  StatsDetailModel.fromJson(Map<String, dynamic> json) {
    this.name = nullChecker(json['name']);
    this.url = nullChecker(json['url']);
  }

  String reFormat(String name) {
    if (name == 'special-attack') return "Sp. Atk";
    if (name == 'special-defense') return "Sp. Def";
    return name;
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "url": this.url,
    };
  }
}
