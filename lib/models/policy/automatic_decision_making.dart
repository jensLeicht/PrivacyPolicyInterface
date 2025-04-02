import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';

part 'automatic_decision_making.g.dart';

@JsonSerializable(explicitToJson: true)
class AutomatedDecisionMaking {
  List<Desc>? desc;
  List<Head>? head;
  String? name;

  AutomatedDecisionMaking(this.desc, this.head, this.name);

  factory AutomatedDecisionMaking.fromJson(Map<String, dynamic> json) =>
      _$AutomatedDecisionMakingFromJson(json);

  Map<String, dynamic> toJson() => _$AutomatedDecisionMakingToJson(this);
}
