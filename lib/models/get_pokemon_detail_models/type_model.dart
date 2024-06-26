import 'package:flutter/material.dart';
import 'package:flutterpokemon/functions/global_func.dart';
import 'package:flutterpokemon/shared/constants.dart';

class TypeModel {
  late int? slot;
  late TypeDetailModel? type;

  TypeModel.fromJson(Map<String, dynamic> json) {
    this.slot = nullChecker(json['slot']);
    this.type = isNotNull(json['type']) ? TypeDetailModel.fromJson(json['type']) : null ;
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
    this.name = nullChecker(json['name']);
    this.url = nullChecker(json['url']);
  }

  Map<String,dynamic> toJson(){
    return {
      "name": this.name,
      "url": this.url
    };
  }
}