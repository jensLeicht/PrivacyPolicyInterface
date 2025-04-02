import 'package:json_annotation/json_annotation.dart';

part 'pseudonymization_method_attribute.g.dart';

@JsonSerializable(explicitToJson: true)
class PseudonymizationMethodAttribute {
  String? key;
  String? value;

  PseudonymizationMethodAttribute(this.key, this.value);

  factory PseudonymizationMethodAttribute.fromJson(Map<String, dynamic> json) =>
      _$PseudonymizationMethodAttributeFromJson(json);

  Map<String, dynamic> toJson() =>
      _$PseudonymizationMethodAttributeToJson(this);
}
