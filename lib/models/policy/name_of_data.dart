import 'package:json_annotation/json_annotation.dart';

part 'name_of_data.g.dart';

@JsonSerializable(explicitToJson: true)
class NameOfData {
  String? name;

  NameOfData(this.name);

  factory NameOfData.fromJson(Map<String, dynamic> json) =>
      _$NameOfDataFromJson(json);

  Map<String, dynamic> toJson() => _$NameOfDataToJson(this);
}
