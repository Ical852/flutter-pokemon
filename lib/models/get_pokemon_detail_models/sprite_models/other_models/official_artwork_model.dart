class OfficialArtworkModel {
  late String? frontDefault, frontShiny;

  OfficialArtworkModel.fromJson(Map<String, dynamic> json) {
    this.frontDefault = json['front_default'];
    this.frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    return {
      "front_default": this.frontDefault,
      "front_shiny": this.frontShiny
    };
}
}