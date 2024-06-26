class DreamWorldModel {
  late String? frontDefault, frontFemale;

  DreamWorldModel.fromJson(Map<String, dynamic> json) {
    this.frontDefault = json['front_default'];
    this.frontFemale = json['front_female'];
  }

  Map<String, dynamic> toJson() {
    return {
      "front_default": this.frontDefault,
      "front_female": this.frontFemale
    };
  }
}