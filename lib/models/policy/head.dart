import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/translation.dart';

part 'head.g.dart';

@JsonSerializable(explicitToJson: true)
class Head implements Translation {
  @override
  String? lang;
  @override
  String? value;

  Head(this.lang, this.value);

  factory Head.fromJson(Map<String, dynamic> json) => _$HeadFromJson(json);

  Map<String, dynamic> toJson() => _$HeadToJson(this);
}
