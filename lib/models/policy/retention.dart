import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';

part 'retention.g.dart';

@JsonSerializable(explicitToJson: true)
class Retention {
  List<Desc>? desc;
  List<Head>? head;
  String? pointInTime;
  String? type;

  Retention(this.desc, this.head, this.pointInTime, this.type);

  factory Retention.fromJson(Map<String, dynamic> json) =>
      _$RetentionFromJson(json);

  Map<String, dynamic> toJson() => _$RetentionToJson(this);
}
