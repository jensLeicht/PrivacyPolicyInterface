import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/safeguard.dart';

part 'data_recipient.g.dart';

@JsonSerializable(explicitToJson: true)
class DataRecipient {
  List<Desc>? desc;
  List<Head>? head;
  bool? adequacyDecision;
  String? authInfo;
  String? classification;
  String? country;
  int? id;
  String? name;
  bool? required;
  String pointOfAcceptance;
  List<Safeguard>? safeguardList;
  bool? thirdCountryTransfer;
  String? type;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool expanded = false;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> error = [];

  DataRecipient(
      this.desc,
      this.head,
      this.adequacyDecision,
      this.authInfo,
      this.classification,
      this.country,
      this.id,
      this.name,
      this.required,
      this.safeguardList,
      this.thirdCountryTransfer,
      this.type,
      this.pointOfAcceptance);

  factory DataRecipient.fromJson(Map<String, dynamic> json) =>
      _$DataRecipientFromJson(json);

  Map<String, dynamic> toJson() => _$DataRecipientToJson(this);
}
