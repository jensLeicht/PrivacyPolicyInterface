import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/anonymization_method.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/data_category.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/data_group.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';

part 'data.g.dart';

@JsonSerializable(explicitToJson: true)
class Data {
  List<Desc>? desc;
  List<Head>? head;
  AnonymizationMethod? anonymizationMethod;
  List<DataCategory>? dataCategoryList;
  List<DataGroup>? dataGroupList;
  String? dataType;
  int? id;
  String? name;
  String? privacyGroup;
  bool? required;
  String pointOfAcceptance;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool expanded = false;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> error = [];

  Data(
      this.desc,
      this.head,
      this.anonymizationMethod,
      this.dataCategoryList,
      this.dataGroupList,
      this.dataType,
      this.id,
      this.name,
      this.privacyGroup,
      this.required,
      this.pointOfAcceptance);

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
