import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/name_of_data.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/privacy_model_attribute.dart';

part 'privacy_model.g.dart';

@JsonSerializable(explicitToJson: true)
class PrivacyModel {
  List<Desc>? desc;
  List<Head>? head;
  String? name;
  List<NameOfData>? nameOfDataList;
  List<PrivacyModelAttribute>? privacyModelAttributeList;

  PrivacyModel(this.desc, this.head, this.name, this.nameOfDataList,
      this.privacyModelAttributeList);

  factory PrivacyModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyModelToJson(this);
}
