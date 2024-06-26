class HomeModel {
  late String? 
      frontDefault,
      frontFemale,
      frontShiny,
      frontShinyFemale;

  HomeModel.fromJson(Map<String, dynamic> json) {
    this.frontDefault = json['front_default'];
    this.frontFemale = json['front_female'];
    this.frontShiny = json['front_shiny'];
    this.frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    return {
      "front_default": this.frontDefault,
      "front_female": this.frontFemale,
      "front_shiny": this.frontShiny,
      "front_shiny_female": this.frontShinyFemale,
    };
  }
}
