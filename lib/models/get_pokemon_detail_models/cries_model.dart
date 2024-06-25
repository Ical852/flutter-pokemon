class CriesModel {
  late String latest;
  late String legacy;

  CriesModel.fromJson(Map<String, dynamic> json) {
    this.latest = json['latest'];
    this.legacy = json['legacy'];
  }

  Map<String, dynamic> toJson() {
    return {
      "latest": this.latest,
      "legacy": this.legacy,
    };
  }
}
