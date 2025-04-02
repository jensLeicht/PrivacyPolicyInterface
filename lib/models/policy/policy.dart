import 'dart:collection';

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/compliant.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/controller.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/data_category.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/data_protection_officer.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/data_source.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/data_subject_right.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/icon.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/purpose.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/purpose_category.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/purpose_category_state.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/purpose_hierarchy.dart';

part 'policy.g.dart';

@JsonSerializable(explicitToJson: true)
class Policy {
  List<Desc>? desc;
  List<Head>? head;
  List<Controller>? controllerList;
  List<DataProtectionOfficer>? dataProtectionOfficerList;
  DataSource? dataSource;
  List<DataSubjectRight>? dataSubjectRightList;
  List<Icon>? iconList;
  String? lang;
  DataCategory? lodgeComplaint;
  String? name;
  String? privacyPolicyUri;
  List<PurposeHierarchy>? purposeHierarchy;
  List<Purpose>? purposeList;
  List<Policy>? underlyingLayeredPrivacyPolicy;
  String? version;

  @JsonKey(includeFromJson: false, includeToJson: false)
  late List<PurposeCategory> purposeCategories = [];
  @JsonKey(includeFromJson: false, includeToJson: false)
  static const List<String> purposeCategoryNames = [
    "accountManagement",
    "communicationManagement",
    "customerManagement",
    "enforceSecurity",
    "humanResourceManagement",
    "legalCompliance",
    "marketing",
    "organisationGovernance",
    "personalisation",
    "recordManagement",
    "researchAndDevelopment",
    "serviceProvision",
    "vendorManagement",
    "other"
  ];
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<bool> purposeCategoryVisibility = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  @JsonKey(includeFromJson: false, includeToJson: false)
  static const List<String> dataCategoryNames = [
    "dc_derived",
    "dc_knowledge",
    "dc_authenticating",
    "dc_preference",
    "dc_identifying",
    "dc_ethnicity",
    "dc_behavioral",
    "dc_demographic",
    "dc_physical",
    "dc_computer",
    "dc_contact",
    "dc_location",
    "dc_historical",
    "dc_account",
    "dc_ownership",
    "dc_transactional",
    "dc_credit",
    "dc_professional",
    "dc_criminal",
    "dc_public",
    "dc_family",
    "dc_social",
    "dc_communication",
    "dc_medical",
    "dc_sexual"
  ];
  @JsonKey(includeFromJson: false, includeToJson: false)
  static const List<String> compactDataCategoryNames = [
    "dc_derived",
    "dc_internal",
    "dc_external",
    "dc_tracking",
    "dc_historical",
    "dc_financial",
    "dc_social"
  ];
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<bool> dataCategoryVisibility = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<List<Map<String, Map<String, bool>>>> matrix = List.generate(
      dataCategoryNames.length,
      (i) => List.generate(purposeCategoryNames.length, (j) => HashMap()));
  @JsonKey(includeFromJson: false, includeToJson: false)
  Compliant compliant = Compliant.processing;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int selectedPurposeCategoryIndex = -1;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int selectedPurposeIndex = -1;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Map<String, int> purposeCategoryIndex = HashMap();
  @JsonKey(includeFromJson: false, includeToJson: false)
  Map<String, int> purposeIndex = HashMap();
  @JsonKey(includeFromJson: false, includeToJson: false)
  Map<int, int> purposeIndexToCategoryIndex = HashMap();
  @JsonKey(includeFromJson: false, includeToJson: false)
  int superPurpose = -1;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> countries = [];

  Policy(
      this.desc,
      this.head,
      this.controllerList,
      this.dataProtectionOfficerList,
      this.dataSource,
      this.dataSubjectRightList,
      this.iconList,
      this.lang,
      this.lodgeComplaint,
      this.name,
      this.privacyPolicyUri,
      this.purposeHierarchy,
      this.purposeList,
      this.underlyingLayeredPrivacyPolicy,
      this.version) {
    for (int i = 0; i < purposeList!.length; i++) {
      purposeIndex[purposeList![i].name!] = i;
    }
    List<PurposeHierarchy>? remainingPurposeHierarchy = [...?purposeHierarchy];
    for (int i = 0; i < purposeCategoryNames.length; i++) {
      purposeCategoryIndex[purposeCategoryNames[i]] = i;
      List<String> subPurposeNames = purposeHierarchy!
          .where((element) => element.superPurpose == purposeCategoryNames[i])
          .map((purpose) => purpose.subPurpose!)
          .toList();
      remainingPurposeHierarchy.removeWhere(
          (element) => element.superPurpose == purposeCategoryNames[i]);
      List<int> subPurposeIndices = [];
      for (String subPurposeName in subPurposeNames) {
        purposeIndexToCategoryIndex[purposeIndex[subPurposeName]!] = i;
        subPurposeIndices.add(purposeIndex[subPurposeName]!);
      }
      PurposeCategory purposeCategory = PurposeCategory(
          purposeCategoryNames[i],
          subPurposeIndices,
          PurposeCategoryState.acceptNone,
          0,
          Compliant.processing);
      purposeCategories.add(purposeCategory);
    }
    for (int i = 0; i < remainingPurposeHierarchy.length; i++) {
      var superPurpose = purposeList!.firstWhere((element) =>
          element.name == remainingPurposeHierarchy[i].superPurpose);
      superPurpose.subPurposeIndices
          .add(purposeIndex[remainingPurposeHierarchy[i].subPurpose]!);
      purposeIndexToCategoryIndex[
              purposeIndex[remainingPurposeHierarchy[i].subPurpose]!] =
          purposeIndexToCategoryIndex[purposeIndex[superPurpose.name]]!;
    }
  }

  factory Policy.fromJson(Map<String, dynamic> json) => _$PolicyFromJson(json);

  Map<String, dynamic> toJson() => _$PolicyToJson(this);

  void selectNone() {
    for (int i = 0; i < purposeCategories.length; i++) {
      purposeCategories[i].decline(i);
    }
  }

  void selectRequired() {
    for (int i = 0; i < purposeList!.length; i++) {
      int? categoryIndex = purposeIndexToCategoryIndex[i];
      if (categoryIndex == null) {
        continue;
      }
      int superPurpose = purposeIndex[purposeList!
              .firstWhereOrNull(
                  (element) => element.subPurposeIndices.contains(i))
              ?.name] ??
          -1;
      for (int j = 0; j < purposeList![i].dataList!.length; j++) {
        if (purposeList![i].dataList![j].required == true) {
          purposeList![i].acceptData(categoryIndex, j, superPurpose);
        }
      }
      for (int j = 0; j < purposeList![i].dataRecipientList!.length; j++) {
        if (purposeList![i].dataRecipientList![j].required == true) {
          purposeList![i].acceptDataRecipient(categoryIndex, j, superPurpose);
        }
      }
    }
  }

  void selectAll() {
    for (int i = 0; i < purposeCategories.length; i++) {
      purposeCategories[i].accept(i);
    }
  }
}
