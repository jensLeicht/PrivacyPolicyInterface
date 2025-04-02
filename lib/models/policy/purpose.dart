import 'dart:collection';

import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/automatic_decision_making.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/data.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/data_recipient.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/desc.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/head.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/legal_basis.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/privacy_model.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/pseudonymization_method.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/purpose_state.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/retention.dart';

part 'purpose.g.dart';

@JsonSerializable(explicitToJson: true)
class Purpose {
  List<Desc>? desc;
  List<Head>? head;
  List<AutomatedDecisionMaking>? automatedDecisionMakingList;
  List<Data>? dataList;
  List<DataRecipient>? dataRecipientList;
  List<LegalBasis>? legalBasisList;
  String? name;
  bool? optOut;
  String pointOfAcceptance;
  List<PrivacyModel>? privacyModelList;
  List<PseudonymizationMethod>? pseudonymizationMethodList;
  bool? required;
  Retention? retention;
  @JsonKey(includeFromJson: false, includeToJson: false)
  PurposeState state = PurposeState.decline;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int numberOfAcceptedData = 0;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int numberOfAcceptedDataRecipients = 0;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int numberOfAcceptedSubPurposes = 0;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int numberOfAcceptedDataRecipientsWithThiryCountryDataTransfer = 0;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int numberOfDataRecipients = 0;
  @JsonKey(includeFromJson: false, includeToJson: false)
  int numberOfThirdCountryDataRecipients = 0;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> error = [];
  @JsonKey(includeFromJson: false, includeToJson: false)
  Map<String, int> dataIndex = HashMap();
  @JsonKey(includeFromJson: false, includeToJson: false)
  Map<String, int> dataRecipientIndex = HashMap();
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<int> subPurposeIndices = [];
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<String> countries = [];

  Purpose(
      this.desc,
      this.head,
      this.automatedDecisionMakingList,
      this.dataList,
      this.dataRecipientList,
      this.legalBasisList,
      this.name,
      this.optOut,
      this.pointOfAcceptance,
      this.privacyModelList,
      this.pseudonymizationMethodList,
      this.required,
      this.retention) {
    for (int i = 0; i < dataList!.length; i++) {
      dataIndex[dataList![i].name!] = i;
    }
    for (int i = 0; i < dataRecipientList!.length; i++) {
      ++numberOfDataRecipients;
      if (dataRecipientList![i].thirdCountryTransfer!) {
        ++numberOfThirdCountryDataRecipients;
      }
      dataRecipientIndex[dataRecipientList![i].name!] = i;
    }
  }

  factory Purpose.fromJson(Map<String, dynamic> json) =>
      _$PurposeFromJson(json);

  Map<String, dynamic> toJson() => _$PurposeToJson(this);

  void accept(int categoryIndex, int superPurpose) {
    final Rx<Policy> policy = Get.find();
    if (superPurpose > -1) {
      if (state == PurposeState.decline) {
        policy.value.purposeList![superPurpose].acceptSubPurpose(
            categoryIndex,
            policy.value.purposeIndex[name]!,
            policy.value.purposeIndex[policy.value.purposeList!
                    .firstWhereOrNull((element) =>
                        element.subPurposeIndices.contains(superPurpose))
                    ?.name] ??
                -1);
      }
    } else {
      if (state == PurposeState.decline) {
        policy.value.purposeCategories[categoryIndex].purposeAccepted();
      }
    }
    pointOfAcceptance =
        DateTime.now().toUtc().millisecondsSinceEpoch.toString();
    state = PurposeState.accept;
    policy.value.purposeCategories[categoryIndex].updateState();
    if (numberOfAcceptedData != dataList!.length) {
      for (int i = 0; i < dataList!.length; i++) {
        acceptData(categoryIndex, i, superPurpose);
      }
    }
    if (numberOfAcceptedDataRecipients != dataRecipientList!.length) {
      for (int i = 0; i < dataRecipientList!.length; i++) {
        acceptDataRecipient(categoryIndex, i, superPurpose);
      }
    }
    if (numberOfAcceptedSubPurposes != subPurposeIndices.length) {
      for (int i = 0; i < subPurposeIndices.length; i++) {
        policy.value.purposeList![subPurposeIndices[i]]
            .accept(categoryIndex, policy.value.purposeIndex[name]!);
      }
    }
    policy.refresh();
  }

  void decline(int categoryIndex, int superPurpose) {
    final Rx<Policy> policy = Get.find();
    if (superPurpose > -1) {
      if (state != PurposeState.decline) {
        policy.value.purposeList![superPurpose].declineSubPurpose(
            categoryIndex,
            policy.value.purposeIndex[name]!,
            policy.value.purposeIndex[policy.value.purposeList!
                    .firstWhereOrNull((element) =>
                        element.subPurposeIndices.contains(superPurpose))
                    ?.name] ??
                -1);
      }
    } else {
      if (state != PurposeState.decline) {
        policy.value.purposeCategories[categoryIndex].purposeDeclined();
      }
    }
    pointOfAcceptance = "";
    state = PurposeState.decline;
    if (numberOfAcceptedData != 0) {
      for (int i = 0; i < dataList!.length; i++) {
        declineData(categoryIndex, i, superPurpose);
      }
    }
    if (numberOfAcceptedDataRecipients != 0) {
      for (int i = 0; i < dataRecipientList!.length; i++) {
        declineDataRecipient(categoryIndex, i, superPurpose);
      }
    }
    if (numberOfAcceptedSubPurposes != 0) {
      for (int i = 0; i < subPurposeIndices.length; i++) {
        policy.value.purposeList![subPurposeIndices[i]]
            .decline(categoryIndex, policy.value.purposeIndex[name]!);
      }
    }
    policy.refresh();
  }

  void acceptData(int categoryIndex, int dataIndex, int superPurpose) {
    final Rx<Policy> policy = Get.find();
    if (dataList![dataIndex].pointOfAcceptance != "") {
      return;
    }
    dataList![dataIndex].pointOfAcceptance =
        DateTime.now().toUtc().millisecondsSinceEpoch.toString();
    numberOfAcceptedData += 1;
    if (state == PurposeState.decline) {
      state = PurposeState.acceptPartly;
      if (superPurpose > -1) {
        policy.value.purposeList![superPurpose].acceptSubPurpose(
            categoryIndex,
            policy.value.purposeIndex[name]!,
            policy.value.purposeIndex[policy.value.purposeList!
                    .firstWhereOrNull((element) =>
                        element.subPurposeIndices.contains(superPurpose))
                    ?.name] ??
                -1);
      } else {
        policy.value.purposeCategories[categoryIndex].purposeAccepted();
      }
    }
    pointOfAcceptance =
        DateTime.now().toUtc().millisecondsSinceEpoch.toString();
    if (superPurpose > -1 &&
        policy.value.purposeList![superPurpose].dataList!
                .firstWhereOrNull(
                    (element) => element.name == dataList![dataIndex].name)!
                .pointOfAcceptance ==
            "") {
      policy.value.purposeList![superPurpose].acceptData(
          categoryIndex,
          policy.value.purposeList![superPurpose]
              .dataIndex[dataList![dataIndex].name]!,
          policy.value.purposeIndex[policy.value.purposeList!
                  .firstWhereOrNull((element) =>
                      element.subPurposeIndices.contains(superPurpose))
                  ?.name] ??
              -1);
    }
    for (int i = 0; i < subPurposeIndices.length; i++) {
      int? dIndex = policy.value.purposeList![subPurposeIndices[i]]
          .dataIndex[dataList![dataIndex].name];
      if (dIndex != null) {
        policy.value.purposeList![subPurposeIndices[i]].acceptData(
            categoryIndex, dIndex, policy.value.purposeIndex[name]!);
      }
    }
    if (numberOfAcceptedSubPurposes == subPurposeIndices.length &&
        numberOfAcceptedData == dataList!.length &&
        numberOfAcceptedDataRecipients == dataRecipientList!.length) {
      accept(categoryIndex, superPurpose);
    }
    _updateMatrix(categoryIndex);
    policy.refresh();
  }

  void declineData(int categoryIndex, int dataIndex, int superPurpose) {
    final Rx<Policy> policy = Get.find();
    if (dataList![dataIndex].pointOfAcceptance == "") {
      return;
    }
    dataList![dataIndex].pointOfAcceptance = "";
    numberOfAcceptedData -= 1;
    if (state == PurposeState.accept) {
      state = PurposeState.acceptPartly;
      if (superPurpose == -1) {
        policy.value.purposeCategories[categoryIndex].updateState();
      }
    }
    for (int i = 0; i < subPurposeIndices.length; i++) {
      int? dIndex = policy.value.purposeList![subPurposeIndices[i]]
          .dataIndex[dataList![dataIndex].name];
      if (dIndex != null) {
        policy.value.purposeList![subPurposeIndices[i]].declineData(
            categoryIndex, dIndex, policy.value.purposeIndex[name]!);
      }
    }
    if (numberOfAcceptedSubPurposes == 0 &&
        numberOfAcceptedData == 0 &&
        numberOfAcceptedDataRecipients == 0) {
      decline(categoryIndex, superPurpose);
    }
    _updateMatrix(categoryIndex);
    policy.refresh();
  }

  void acceptDataRecipient(
      int categoryIndex, int dataRecipientIndex, int superPurpose) {
    final Rx<Policy> policy = Get.find();
    if (dataRecipientList![dataRecipientIndex].pointOfAcceptance != "") {
      return;
    }
    if (dataRecipientList![dataRecipientIndex].thirdCountryTransfer == true) {
      numberOfAcceptedDataRecipientsWithThiryCountryDataTransfer += 1;
    }
    dataRecipientList![dataRecipientIndex].pointOfAcceptance =
        DateTime.now().toUtc().millisecondsSinceEpoch.toString();
    numberOfAcceptedDataRecipients += 1;
    policy.value.countries.add(dataRecipientList![dataRecipientIndex].country!);
    countries.add(dataRecipientList![dataRecipientIndex].country!);
    if (state == PurposeState.decline) {
      state = PurposeState.acceptPartly;
      if (superPurpose > -1) {
        policy.value.purposeList![superPurpose].acceptSubPurpose(
            categoryIndex,
            policy.value.purposeIndex[name]!,
            policy.value.purposeIndex[policy.value.purposeList!
                    .firstWhereOrNull((element) =>
                        element.subPurposeIndices.contains(superPurpose))
                    ?.name] ??
                -1);
      } else {
        policy.value.purposeCategories[categoryIndex].purposeAccepted();
      }
    }
    pointOfAcceptance =
        DateTime.now().toUtc().millisecondsSinceEpoch.toString();
    if (superPurpose > -1 &&
        policy.value.purposeList![superPurpose].dataRecipientList!
                .firstWhereOrNull((element) =>
                    element.name ==
                    dataRecipientList![dataRecipientIndex].name)!
                .pointOfAcceptance ==
            "") {
      policy.value.purposeList![superPurpose].acceptDataRecipient(
          categoryIndex,
          policy.value.purposeList![superPurpose]
              .dataRecipientIndex[dataRecipientList![dataRecipientIndex].name]!,
          policy.value.purposeIndex[policy.value.purposeList!
                  .firstWhereOrNull((element) =>
                      element.subPurposeIndices.contains(superPurpose))
                  ?.name] ??
              -1);
    }
    for (int i = 0; i < subPurposeIndices.length; i++) {
      int? drIndex = policy.value.purposeList![subPurposeIndices[i]]
          .dataRecipientIndex[dataRecipientList![dataRecipientIndex].name];
      if (drIndex != null) {
        policy.value.purposeList![subPurposeIndices[i]].acceptDataRecipient(
            categoryIndex, drIndex, policy.value.purposeIndex[name]!);
      }
    }
    if (numberOfAcceptedSubPurposes == subPurposeIndices.length &&
        numberOfAcceptedDataRecipients == dataRecipientList!.length &&
        numberOfAcceptedData == dataList!.length) {
      accept(categoryIndex, superPurpose);
    }
    _updateMatrix(categoryIndex);
    policy.refresh();
  }

  void declineDataRecipient(
      int categoryIndex, int dataRecipientIndex, int superPurpose) {
    final Rx<Policy> policy = Get.find();
    if (dataRecipientList![dataRecipientIndex].pointOfAcceptance == "") {
      return;
    }
    if (dataRecipientList![dataRecipientIndex].thirdCountryTransfer == true) {
      numberOfAcceptedDataRecipientsWithThiryCountryDataTransfer -= 1;
    }
    dataRecipientList![dataRecipientIndex].pointOfAcceptance = "";
    numberOfAcceptedDataRecipients -= 1;
    policy.value.countries
        .remove(dataRecipientList![dataRecipientIndex].country!);
    countries.remove(dataRecipientList![dataRecipientIndex].country!);
    if (state == PurposeState.accept) {
      state = PurposeState.acceptPartly;
      if (superPurpose == -1) {
        policy.value.purposeCategories[categoryIndex].updateState();
      }
    }
    for (int i = 0; i < subPurposeIndices.length; i++) {
      int? drIndex = policy.value.purposeList![subPurposeIndices[i]]
          .dataRecipientIndex[dataRecipientList![dataRecipientIndex].name];
      if (drIndex != null) {
        policy.value.purposeList![subPurposeIndices[i]].declineDataRecipient(
            categoryIndex, drIndex, policy.value.purposeIndex[name]!);
      }
    }
    if (numberOfAcceptedSubPurposes == 0 &&
        numberOfAcceptedDataRecipients == 0 &&
        numberOfAcceptedData == 0) {
      decline(categoryIndex, superPurpose);
    }
    _updateMatrix(categoryIndex);
    policy.refresh();
  }

  void acceptSubPurpose(
      int categoryIndex, int subPurposeIndex, int superPurpose) {
    final Rx<Policy> policy = Get.find();
    List<Purpose>? purposes = policy.value.purposeList;
    if (purposes![subPurposeIndex].pointOfAcceptance != "") {
      return;
    }
    if (state == PurposeState.decline) {
      state = PurposeState.acceptPartly;
      if (superPurpose > -1) {
        policy.value.purposeList![superPurpose].acceptSubPurpose(
            categoryIndex,
            policy.value.purposeIndex[name]!,
            policy.value.purposeIndex[policy.value.purposeList!
                    .firstWhereOrNull((element) =>
                        element.subPurposeIndices.contains(superPurpose))
                    ?.name] ??
                -1);
      } else {
        policy.value.purposeCategories[categoryIndex].purposeAccepted();
      }
    }
    pointOfAcceptance =
        DateTime.now().toUtc().millisecondsSinceEpoch.toString();
    numberOfAcceptedSubPurposes += 1;
    if (numberOfAcceptedSubPurposes == subPurposeIndices.length &&
        numberOfAcceptedDataRecipients == dataRecipientList!.length &&
        numberOfAcceptedData == dataList!.length) {
      accept(categoryIndex, superPurpose);
    }
    _updateMatrix(categoryIndex);
    policy.refresh();
  }

  void declineSubPurpose(
      int categoryIndex, int subPurposeIndex, int superPurpose) {
    final Rx<Policy> policy = Get.find();
    List<Purpose>? purposes = policy.value.purposeList;
    if (purposes![subPurposeIndex].pointOfAcceptance == "") {
      return;
    }
    numberOfAcceptedSubPurposes -= 1;
    if (state == PurposeState.accept) {
      state = PurposeState.acceptPartly;
      if (superPurpose > -1) {
        policy.value.purposeList![superPurpose].declineSubPurpose(
            categoryIndex,
            policy.value.purposeIndex[name]!,
            policy.value.purposeIndex[policy.value.purposeList!
                    .firstWhereOrNull((element) =>
                        element.subPurposeIndices.contains(superPurpose))
                    ?.name] ??
                -1);
      } else {
        policy.value.purposeCategories[categoryIndex].updateState();
      }
    }
    if (numberOfAcceptedSubPurposes == 0 &&
        numberOfAcceptedDataRecipients == 0 &&
        numberOfAcceptedData == 0) {
      decline(categoryIndex, superPurpose);
    }
    _updateMatrix(categoryIndex);
    policy.refresh();
  }

  _updateMatrix(int categoryIndex) {
    Rx<Policy> policy = Get.find();
    int realCategoryIndex = Policy.purposeCategoryNames
        .indexOf(policy.value.purposeCategories[categoryIndex].name);
    for (int i = 0; i < dataList!.length; i++) {
      for (int j = 0; j < dataList![i].dataCategoryList!.length; j++) {
        int dataCategoryIndex = Policy.dataCategoryNames
            .indexOf(dataList![i].dataCategoryList![j].name!);
        String type = "";
        if (numberOfDataRecipients > 0) {
          if (numberOfThirdCountryDataRecipients > 0) {
            type = "outside";
          } else {
            type = "inside";
          }
        } else {
          type = "internal";
        }
        if (!policy.value.matrix[dataCategoryIndex][realCategoryIndex]
            .containsKey(type)) {
          policy.value.matrix[dataCategoryIndex][realCategoryIndex][type] =
              HashMap();
        }
        policy.value.matrix[dataCategoryIndex][realCategoryIndex]
                [type]![Localization.getTranslation(dataList![i].head)] =
            dataList![i].pointOfAcceptance != "";
      }
    }

    for (int i = 0; i < policy.value.purposeCategoryVisibility.length; i++) {
      bool notEmpty = false;
      for (int j = 0; j < policy.value.matrix.length; j++) {
        notEmpty |= policy.value.matrix[j][i].isNotEmpty;
      }
      policy.value.purposeCategoryVisibility[i] = notEmpty;
    }
    for (int i = 0; i < policy.value.dataCategoryVisibility.length; i++) {
      bool notEmpty = false;
      for (int j = 0; j < policy.value.matrix[i].length; j++) {
        notEmpty |= policy.value.matrix[i][j].isNotEmpty;
      }
      policy.value.dataCategoryVisibility[i] = notEmpty;
    }
  }
}
