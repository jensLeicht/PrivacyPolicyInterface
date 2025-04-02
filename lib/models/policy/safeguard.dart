import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';

part 'safeguard.g.dart';

@JsonSerializable(explicitToJson: true)
class Safeguard {
  List<Desc>? desc;
  List<Head>? head;
  String? name;

  Safeguard(this.desc, this.head, this.name);

  factory Safeguard.fromJson(Map<String, dynamic> json) =>
      _$SafeguardFromJson(json);

  Map<String, dynamic> toJson() => _$SafeguardToJson(this);
}
