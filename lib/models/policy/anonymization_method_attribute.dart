import 'package:json_annotation/json_annotation.dart';

part 'anonymization_method_attribute.g.dart';

@JsonSerializable(explicitToJson: true)
class AnonymizationMethodAttribute {
  String? key;
  String? value;

  AnonymizationMethodAttribute(this.key, this.value);

  factory AnonymizationMethodAttribute.fromJson(Map<String, dynamic> json) =>
      _$AnonymizationMethodAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$AnonymizationMethodAttributeToJson(this);
}
