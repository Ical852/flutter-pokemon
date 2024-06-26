class TypeModel {
  late int slot;
  late TypeDetailModel type;

  TypeModel.fromJson(Map<String, dynamic> json) {
    this.slot = json['slot'];
    this.type = TypeDetailModel.fromJson(json['type']);
  }

  Map<String, dynamic> toJson() {
    return {
      "slot": this.slot,
      "type": this.type.toJson()
    };
  }
}

class TypeDetailModel {
  late String name, url;

  TypeDetailModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.url = json['url'];
  }

  Map<String,dynamic> toJson(){
    return {
      "name": this.name,
      "url": this.url
    };
  }
}