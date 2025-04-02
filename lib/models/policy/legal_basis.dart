import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';

part 'legal_basis.g.dart';

@JsonSerializable(explicitToJson: true)
class LegalBasis {
  List<Desc>? desc;
  List<Head>? head;
  String? lbCategory;

  LegalBasis(this.desc, this.head, this.lbCategory);

  factory LegalBasis.fromJson(Map<String, dynamic> json) =>
      _$LegalBasisFromJson(json);

  Map<String, dynamic> toJson() => _$LegalBasisToJson(this);
}
