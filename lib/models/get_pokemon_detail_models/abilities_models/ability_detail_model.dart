class AbilityDetailModel {
  late String name;
  late String url;

  AbilityDetailModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url};
  }
}
