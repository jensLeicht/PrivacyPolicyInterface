import 'package:json_annotation/json_annotation.dart';

part 'initial_policy_check_response.g.dart';

@JsonSerializable(explicitToJson: true)
class InitialPolicyCheckResponse {
  String result;

  InitialPolicyCheckResponse(this.result);

  factory InitialPolicyCheckResponse.fromJson(Map<String, dynamic> json) =>
      _$InitialPolicyCheckResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InitialPolicyCheckResponseToJson(this);
}
