class FormsModel {
  late String name;
  late String url;

  FormsModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url};
  }
}
