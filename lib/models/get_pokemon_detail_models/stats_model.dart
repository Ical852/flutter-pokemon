class StatsModel {
  late int baseStat, effort;
  late StatsDetailModel stat;

  StatsModel.fromJson(Map<String, dynamic> json) {
    this.baseStat = json['base_stat'];
    this.effort = json['effort'];
    this.stat = StatsDetailModel.fromJson(json['stat']);
  }

  Map<String, dynamic> toJson() {
    return {
      "base_stat": this.baseStat,
      "effort": this.effort,
      "stat": this.stat.toJson(),
    };
  }
}

class StatsDetailModel {
  late String name, url;

  StatsDetailModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "url": this.url,
    };
  }
}