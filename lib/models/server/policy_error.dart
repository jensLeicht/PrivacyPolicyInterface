import 'package:json_annotation/json_annotation.dart';

part 'policy_error.g.dart';

@JsonSerializable(explicitToJson: true)
class PolicyError {
  String type;
  String? purposeID;
  String id;
  List<String> errorIDs;

  PolicyError(this.type, this.purposeID, this.id, this.errorIDs);

  factory PolicyError.fromJson(Map<String, dynamic> json) =>
      _$PolicyErrorFromJson(json);

  Map<String, dynamic> toJson() => _$PolicyErrorToJson(this);
}
