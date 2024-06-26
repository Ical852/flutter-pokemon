class LanguageModel {
  late String name, url;

  LanguageModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url};
  }
}