import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/name_of_data.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/pseudonymization_method_attribute.dart';

part 'pseudonymization_method.g.dart';

@JsonSerializable(explicitToJson: true)
class PseudonymizationMethod {
  List<Desc>? desc;
  List<Head>? head;
  String? attrName;
  String? name;
  List<NameOfData>? nameOfDataList;
  List<PseudonymizationMethodAttribute>? pseudonymizationMethodAttributeList;

  PseudonymizationMethod(this.desc, this.head, this.attrName, this.name,
      this.nameOfDataList, this.pseudonymizationMethodAttributeList);

  factory PseudonymizationMethod.fromJson(Map<String, dynamic> json) =>
      _$PseudonymizationMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PseudonymizationMethodToJson(this);
}
