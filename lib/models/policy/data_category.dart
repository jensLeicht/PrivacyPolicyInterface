import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';

part 'data_category.g.dart';

@JsonSerializable(explicitToJson: true)
class DataCategory {
  List<Desc>? desc;
  List<Head>? head;
  String? name;

  DataCategory(this.desc, this.head, this.name);

  factory DataCategory.fromJson(Map<String, dynamic> json) =>
      _$DataCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DataCategoryToJson(this);
}
