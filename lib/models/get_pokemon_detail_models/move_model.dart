import 'package:flutterpokemon/functions/global_func.dart';

class MoveModel {
  late MoveDetailModel? move;
  late List<VersionGroupDetailsModel>? versionGroupDetails;

  MoveModel.fromJson(Map<String, dynamic> json) {
    this.move =
        isNotNull(json['move']) ? MoveDetailModel.fromJson(json['move']) : null;
    this.versionGroupDetails = isNotNull(json['version_group_details'])
        ? json['version_group_details']
            .map<VersionGroupDetailsModel>(
                (result) => VersionGroupDetailsModel.fromJson(result))
            .toList()
        : null;
  }

  Map<String, dynamic> toJson() {
    return {"move": this.move?.toJson()};
  }
}

class MoveDetailModel {
  late String? name, url;

  MoveDetailModel.fromJson(Map<String, dynamic> json) {
    this.name = nullChecker(json['name']);
    this.url = nullChecker(json['url']);
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url};
  }
}

class VersionGroupDetailsModel {
  late int? levelLearnedAt;
  late MoveLearnMethodModel? moveLearnMethod;
  late VersionGroupModel? versionGroup;

  VersionGroupDetailsModel.fromJson(Map<String, dynamic> json) {
    this.levelLearnedAt = nullChecker(json['level_learned_at']);
    this.moveLearnMethod = isNotNull(json['move_learn_method'])
        ? MoveLearnMethodModel.fromJson(json['move_learn_method'])
        : null;
    this.versionGroup = isNotNull(json['version_group'])
        ? VersionGroupModel.fromJson(json['version_group'])
        : null;
  }
}

class MoveLearnMethodModel {
  late String? name, url;

  MoveLearnMethodModel.fromJson(Map<String, dynamic> json) {
    this.name = nullChecker(json['name']);
    this.url = nullChecker(json['url']);
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url};
  }
}

class VersionGroupModel {
  late String? name, url;

  VersionGroupModel.fromJson(Map<String, dynamic> json) {
    this.name = nullChecker(json['name']);
    this.url = nullChecker(json['url']);
  }

  Map<String, dynamic> toJson() {
    return {"name": this.name, "url": this.url};
  }
}
