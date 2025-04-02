import 'package:json_annotation/json_annotation.dart';

part 'hierarchy_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class HierarchyEntity {
  String? value;

  HierarchyEntity(this.value);

  factory HierarchyEntity.fromJson(Map<String, dynamic> json) =>
      _$HierarchyEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HierarchyEntityToJson(this);
}
