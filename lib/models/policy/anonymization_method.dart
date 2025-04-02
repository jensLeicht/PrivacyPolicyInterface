import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/anonymization_method_attribute.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/hierarchy_entity.dart';

part 'anonymization_method.g.dart';

@JsonSerializable(explicitToJson: true)
class AnonymizationMethod {
  List<Desc>? desc;
  List<Head>? head;
  List<AnonymizationMethodAttribute>? anonymizationMethodAttributeList;
  List<HierarchyEntity>? hierarchyEntityList;
  String? name;

  AnonymizationMethod(
      this.desc,
      this.head,
      this.anonymizationMethodAttributeList,
      this.hierarchyEntityList,
      this.name);

  factory AnonymizationMethod.fromJson(Map<String, dynamic> json) =>
      _$AnonymizationMethodFromJson(json);

  Map<String, dynamic> toJson() => _$AnonymizationMethodToJson(this);
}
