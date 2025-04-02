import 'package:json_annotation/json_annotation.dart';

part 'purpose_hierarchy.g.dart';

@JsonSerializable(explicitToJson: true)
class PurposeHierarchy {
  String? subPurpose;
  String? superPurpose;

  PurposeHierarchy(this.subPurpose, this.superPurpose);

  factory PurposeHierarchy.fromJson(Map<String, dynamic> json) =>
      _$PurposeHierarchyFromJson(json);

  Map<String, dynamic> toJson() => _$PurposeHierarchyToJson(this);
}
