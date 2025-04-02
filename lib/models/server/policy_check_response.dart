import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/server/policy_error.dart';

part 'policy_check_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PolicyCheckResponse {
  final List<PolicyError> errors;

  PolicyCheckResponse(this.errors);

  factory PolicyCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$PolicyCheckResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PolicyCheckResponseToJson(this);
}
