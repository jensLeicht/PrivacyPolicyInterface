import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';

part 'data_group.g.dart';

@JsonSerializable(explicitToJson: true)
class DataGroup {
  List<Desc>? desc;
  List<Head>? head;
  String? name;

  DataGroup(this.desc, this.head, this.name);

  factory DataGroup.fromJson(Map<String, dynamic> json) =>
      _$DataGroupFromJson(json);

  Map<String, dynamic> toJson() => _$DataGroupToJson(this);
}
