import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';

part 'icon.g.dart';

@JsonSerializable(explicitToJson: true)
class Icon {
  List<Desc>? desc;
  List<Head>? head;
  String? name;

  Icon(this.desc, this.head, this.name);

  factory Icon.fromJson(Map<String, dynamic> json) => _$IconFromJson(json);

  Map<String, dynamic> toJson() => _$IconToJson(this);
}
