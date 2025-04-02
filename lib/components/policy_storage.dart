import 'dart:collection';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/components/network.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/compliant.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/config.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:pripocog_privacy_policy_interface/models/server/initial_policy_check_response.dart';
import 'package:pripocog_privacy_policy_interface/models/server/policy_check_response.dart';
import 'package:pripocog_privacy_policy_interface/models/server/policy_error.dart';

class PolicyStorage {
  static late Config config;
  static late Rx<Policy> policy;

  static Future<void> loadConfig() async {
    String rawJson = await rootBundle.loadString("assets/config.json");
    Map<String, dynamic> jsonMap = jsonDecode(rawJson);
    config = Config.fromJson(jsonMap);
  }

  static Future<InitialPolicyCheckResponse> loadPolicy() async {
    String rawJson = await rootBundle.loadString("assets/policy.json");
    Map<String, dynamic> jsonMap = jsonDecode(rawJson);
    Policy newPolicy = Policy.fromJson(jsonMap);
    policy = newPolicy.obs;
    _initializeMatrix();
    Get.put(policy);
    InitialPolicyCheckResponse response = await checkInitialPolicy();
    return response;
  }

  static void _initializeMatrix() {
    for (int p = 0; p < policy.value.purposeList!.length; p++) {
      var purpose = policy.value.purposeList![p];
      if (policy.value.purposeIndexToCategoryIndex.containsKey(p)) {
        int realCategoryIndex = policy.value.purposeIndexToCategoryIndex[p]!;
        var dataList = purpose.dataList;
        for (int i = 0; i < dataList!.length; i++) {
          for (int j = 0; j < dataList[i].dataCategoryList!.length; j++) {
            int dataCategoryIndex = Policy.dataCategoryNames
                .indexOf(dataList[i].dataCategoryList![j].name!);
            String type = "";
            if (purpose.numberOfDataRecipients > 0) {
              if (purpose.numberOfThirdCountryDataRecipients > 0) {
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
                    [type]![Localization.getTranslation(dataList[i].head)] =
                dataList[i].pointOfAcceptance != "";
          }
        }
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

  static Future<InitialPolicyCheckResponse> checkInitialPolicy() async {
    Rx<Policy> policy = Get.find();
    int code;
    String jsonResponse;
    (code, jsonResponse) = await Network.postInitialPolicy(policy.value);
    if (code == 200) {
      Map<String, dynamic> mapResponse = jsonDecode(jsonResponse);
      InitialPolicyCheckResponse initialPolicyCheckResponse =
          InitialPolicyCheckResponse.fromJson(mapResponse);
      return initialPolicyCheckResponse;
    } else {
      return InitialPolicyCheckResponse("Internal Server Error");
    }
  }

  static Future<void> checkPolicy() async {
    Rx<Policy> policy = Get.find();
    policy.value.compliant = Compliant.processing;
    for (int i = 0; i < policy.value.purposeCategories.length; i++) {
      policy.value.purposeCategories[i].error.clear();
      policy.value.purposeCategories[i].compliant = Compliant.processing;
    }
    for (int i = 0; i < policy.value.purposeList!.length; i++) {
      policy.value.purposeList![i].error.clear();
      for (int j = 0; j < policy.value.purposeList![i].dataList!.length; j++) {
        policy.value.purposeList![i].dataList![j].error.clear();
      }
      for (int j = 0;
          j < policy.value.purposeList![i].dataRecipientList!.length;
          j++) {
        policy.value.purposeList![i].dataRecipientList![j].error.clear();
      }
    }
    policy.refresh();
    int code;
    String jsonResponse;
    (code, jsonResponse) = await Network.postPolicy(policy.value);
    if (code == 200) {
      PolicyCheckResponse response = PolicyCheckResponse([]);
      for (int i = 0; i < policy.value.purposeCategories.length; i++) {
        policy.value.purposeCategories[i].compliant = Compliant.compliant;
      }
      if (jsonResponse != "") {
        policy.value.compliant = Compliant.notCompliant;
        Map<String, dynamic> responseMap = jsonDecode(jsonResponse);
        response = PolicyCheckResponse.fromJson(responseMap);
        for (PolicyError error in response.errors) {
          if (error.type == "purposeCategory") {
            int purposeCategoryIndex =
                policy.value.purposeCategoryIndex[error.purposeID]!;
            policy.value.purposeCategories[purposeCategoryIndex].compliant =
                Compliant.notCompliant;
            policy.value.purposeCategories[purposeCategoryIndex].error =
                error.errorIDs;
          } else {
            int purposeIndex = policy.value.purposeIndex[error.purposeID]!;
            if (error.type == "data") {
              int dataIndex =
                  policy.value.purposeList![purposeIndex].dataIndex[error.id]!;
              policy.value.purposeList![purposeIndex].dataList![dataIndex]
                  .error = error.errorIDs;
            } else if (error.type == "dataRecipient") {
              int dataRecipientIndex = policy.value.purposeList![purposeIndex]
                  .dataRecipientIndex[error.id]!;
              policy
                  .value
                  .purposeList![purposeIndex]
                  .dataRecipientList![dataRecipientIndex]
                  .error = error.errorIDs;
            } else if (error.type == "purpose") {
              policy.value.purposeList![purposeIndex].error = error.errorIDs;
            }
          }
        }
      } else {
        policy.value.compliant = Compliant.compliant;
      }
      policy.refresh();
    } else {
      policy.value.compliant = Compliant.processing;
    }
  }
}
