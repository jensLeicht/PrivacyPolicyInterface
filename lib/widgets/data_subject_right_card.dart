import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/components/localization.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:vector_graphics/vector_graphics.dart';

class DataSubjectRightCard extends StatelessWidget {
  final int index;

  const DataSubjectRightCard({
    super.key,
    required this.index,
  });

  String _getImageURI(String name) {
    switch (name) {
      case "access":
        return "assets/DaPIS/data_subject_rights/right_access.svg";
      case "rectification":
        return "assets/DaPIS/data_subject_rights/right_rectification.svg";
      case "erasure":
        return "assets/DaPIS/data_subject_rights/right_erasure.svg";
      case "restriction":
        return "assets/DaPIS/data_subject_rights/right_restrict.svg";
      case "portability":
        return "assets/DaPIS/data_subject_rights/right_portability.svg";
      case "objection":
        return "assets/DaPIS/data_subject_rights/right_object.svg";
      case "intervention":
        return "assets/DaPIS/data_subject_rights/right_intervention.svg";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Divider(
              color: Colors.transparent,
              height: 0,
            ),
            Tooltip(
              message: Localization.getTranslation(
                  policy.value.dataSubjectRightList![index].head),
              preferBelow: false,
              child: VectorGraphic(
                loader: AssetBytesLoader(_getImageURI(
                    policy.value.dataSubjectRightList![index].name ?? "")),
                semanticsLabel: policy.value.dataSubjectRightList![index].name,
                height: 40,
                width: 40,
              ),
            ),
            Text(Localization.getTranslation(
                policy.value.dataSubjectRightList![index].desc)),
          ],
        ),
      ),
    );
  }
}
