import 'package:json_annotation/json_annotation.dart';

part 'privacy_model_attribute.g.dart';

@JsonSerializable(explicitToJson: true)
class PrivacyModelAttribute {
  String? key;
  String? value;

  PrivacyModelAttribute(this.key, this.value);

  factory PrivacyModelAttribute.fromJson(Map<String, dynamic> json) =>
      _$PrivacyModelAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyModelAttributeToJson(this);
}
