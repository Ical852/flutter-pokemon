import 'package:flutterpokemon/functions/global_func.dart';

class StatsModel {
  late int? baseStat, effort;
  late StatsDetailModel? stat;

  StatsModel.fromJson(Map<String, dynamic> json) {
    this.baseStat = nullChecker(json['base_stat'], json['base_stat']);
    this.effort = nullChecker(json['effort'], json['effort']);
    this.stat = StatsDetailModel.fromJson(json['stat']);
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
    this.name = nullChecker(json['name'], json['name']);
    this.url = nullChecker(json['url'], json['url']);
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "url": this.url,
    };
  }
}