class MoveModel {
  late MoveDetailModel move;

  MoveModel.fromJson(Map<String, dynamic> json) {
    this.move = MoveDetailModel.fromJson(json['move']);
  }

  Map<String, dynamic> toJson() {
    return {
      "move": this.move.toJson()
    };
  }
}

class MoveDetailModel {
  late String name, url;

  MoveDetailModel.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.url = json['url'];
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url};
  }
}
