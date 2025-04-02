import 'package:json_annotation/json_annotation.dart';

part 'data_source.g.dart';

@JsonSerializable(explicitToJson: true)
class DataSource {
  String? authInfo;
  String? classification;
  String? name;
  String? publicAvailable;
  String? type;

  DataSource(this.authInfo, this.classification, this.name,
      this.publicAvailable, this.type);

  factory DataSource.fromJson(Map<String, dynamic> json) =>
      _$DataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceToJson(this);
}
