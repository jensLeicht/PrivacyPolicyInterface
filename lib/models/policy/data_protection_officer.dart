import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';

part 'data_protection_officer.g.dart';

@JsonSerializable(explicitToJson: true)
class DataProtectionOfficer {
  List<Desc>? desc;
  List<Head>? head;
  String? address;
  String? authInfo;
  String? classification;
  String? email;
  String? firstName;
  String? lastName;
  String? name;
  String? phoneNumber;
  String? type;

  DataProtectionOfficer(
      this.desc,
      this.head,
      this.address,
      this.authInfo,
      this.classification,
      this.email,
      this.firstName,
      this.lastName,
      this.name,
      this.phoneNumber,
      this.type);

  factory DataProtectionOfficer.fromJson(Map<String, dynamic> json) =>
      _$DataProtectionOfficerFromJson(json);

  Map<String, dynamic> toJson() => _$DataProtectionOfficerToJson(this);
}
