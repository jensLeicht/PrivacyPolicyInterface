import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/translation.dart';

part 'desc.g.dart';

@JsonSerializable(explicitToJson: true)
class Desc implements Translation {
  @override
  String? lang;
  @override
  String? value;

  Desc(this.lang, this.value);

  factory Desc.fromJson(Map<String, dynamic> json) => _$DescFromJson(json);

  Map<String, dynamic> toJson() => _$DescToJson(this);
}
