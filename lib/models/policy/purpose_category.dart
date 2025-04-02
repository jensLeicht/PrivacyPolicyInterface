import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/compliant.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/purpose_category_state.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/purpose_state.dart';

class PurposeCategory {
  String name;
  List<int> subPurposeIndices;
  PurposeCategoryState state;
  int numberOfAcceptedPurposes;
  Compliant compliant;
  bool expanded = false;
  List<String> error = [];

  PurposeCategory(this.name, this.subPurposeIndices, this.state,
      this.numberOfAcceptedPurposes, this.compliant);

  void accept(int categoryIndex) {
    final Rx<Policy> policy = Get.find();
    for (int subPurposeIndex in subPurposeIndices) {
      policy.value.purposeList![subPurposeIndex].accept(categoryIndex, -1);
    }
    policy.refresh();
  }

  void decline(int categoryIndex) {
    final Rx<Policy> policy = Get.find();
    for (int subPurposeIndex in subPurposeIndices) {
      policy.value.purposeList![subPurposeIndex].decline(categoryIndex, -1);
    }
    policy.refresh();
  }

  void purposeAccepted() {
    numberOfAcceptedPurposes += 1;
    updateState();
  }

  void updateState() {
    if (numberOfAcceptedPurposes == subPurposeIndices.length) {
      final Rx<Policy> policy = Get.find();
      bool partial = false;
      for (int subPurposeIndex in subPurposeIndices) {
        partial |= policy.value.purposeList![subPurposeIndex].state ==
            PurposeState.acceptPartly;
      }
      state = partial
          ? PurposeCategoryState.acceptSome
          : PurposeCategoryState.acceptAll;
    } else {
      if (numberOfAcceptedPurposes > 0) {
        state = PurposeCategoryState.acceptSome;
      } else {
        state = PurposeCategoryState.acceptNone;
      }
    }
  }

  void purposeDeclined() {
    numberOfAcceptedPurposes -= 1;
    updateState();
  }
}
