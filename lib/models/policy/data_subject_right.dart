import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';

part 'data_subject_right.g.dart';

@JsonSerializable(explicitToJson: true)
class DataSubjectRight {
  List<Desc>? desc;
  List<Head>? head;
  String? name;

  DataSubjectRight(this.desc, this.head, this.name);

  factory DataSubjectRight.fromJson(Map<String, dynamic> json) =>
      _$DataSubjectRightFromJson(json);

  Map<String, dynamic> toJson() => _$DataSubjectRightToJson(this);
}
