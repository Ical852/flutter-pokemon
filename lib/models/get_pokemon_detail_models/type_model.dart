import 'package:flutterpokemon/functions/global_func.dart';

class TypeModel {
  late int? slot;
  late TypeDetailModel? type;

  TypeModel.fromJson(Map<String, dynamic> json) {
    this.slot = nullChecker(json['slot'], json['slot']);
    this.type = nullChecker(json['type'], TypeDetailModel.fromJson(json['type'])) ;
  }

  Map<String, dynamic> toJson() {
    return {
      "slot": this.slot,
      "type": this.type?.toJson()
    };
  }
}

class TypeDetailModel {
  late String? name, url;

  TypeDetailModel.fromJson(Map<String, dynamic> json) {
    this.name = nullChecker(json['name'], json['name']);
    this.url = nullChecker(json['url'], json['url']);
  }

  Map<String,dynamic> toJson(){
    return {
      "name": this.name,
      "url": this.url
    };
  }
}