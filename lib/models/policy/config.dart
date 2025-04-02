import 'package:json_annotation/json_annotation.dart';

part 'config.g.dart';

@JsonSerializable(explicitToJson: true)
class Config {
  String? homepageUrl;
  String? logoName;
  String? fullTextPolicyUrl;

  Config(this.homepageUrl, this.logoName, this.fullTextPolicyUrl);

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}
