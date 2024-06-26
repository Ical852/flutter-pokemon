class ShowdownModel {
  late String? backDefault, backFemale, backShiny, backShinyFemale, frontDefault, frontFemale,frontShiny,frontShinyFemale;

  ShowdownModel.fromJson(Map<String, dynamic> json) {
    this.backDefault = json['back_default'];
    this.backFemale = json['back_female'];
    this.backShiny = json['back_shiny'];
    this.backShinyFemale = json['back_shiny_female'];
    this.frontDefault = json['front_default'];
    this.frontFemale = json['front_female'];
    this.frontShiny = json['front_shiny'];
    this.frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    return {
      "back_default": this.backDefault,
      "back_female": this.backFemale,
      "back_shiny": this.backShiny,
      "back_shiny_female": this.backShinyFemale,
      "front_default": this.frontDefault,
      "front_female": this.frontFemale,
      "front_shiny": this.frontShiny,
      "front_shiny_female": this.frontShinyFemale,
    };
  }
}