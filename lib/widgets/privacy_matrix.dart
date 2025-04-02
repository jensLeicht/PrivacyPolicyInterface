import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:vector_graphics/vector_graphics.dart';

class PrivacyMatrix extends StatelessWidget {
  const PrivacyMatrix({super.key});

  InlineSpan _getHoverText(Rx<Policy> policy, int i, int j) {
    var headline = "";
    var messageA = "";
    var messageD = "";
    if (policy.value.matrix[i][j].containsKey("inside")) {
      headline = "EU-Processing";
      messageA = policy.value.matrix[i][j]["inside"]!.entries
          .where((entry) => entry.value)
          .fold("", (a, b) => "$a ${b.key},");
      if (messageA.isNotEmpty) {
        messageA = messageA.substring(0, messageA.length - 1);
      }
      messageD = policy.value.matrix[i][j]["inside"]!.entries
          .where((entry) => !entry.value)
          .fold("", (a, b) => "$a ${b.key},");
      if (messageD.isNotEmpty) {
        messageD = messageD.substring(0, messageD.length - 1);
      }
    } else {
      if (policy.value.matrix[i][j].containsKey("outside")) {
        headline = "Non-EU-Processing";
        messageA = policy.value.matrix[i][j]["outside"]!.entries
            .where((entry) => entry.value)
            .fold("", (a, b) => "$a ${b.key},");
        if (messageA.isNotEmpty) {
          messageA = messageA.substring(0, messageA.length - 1);
        }
        messageD = policy.value.matrix[i][j]["outside"]!.entries
            .where((entry) => !entry.value)
            .fold("", (a, b) => "$a ${b.key},");
        if (messageD.isNotEmpty) {
          messageD = messageD.substring(0, messageD.length - 1);
        }
      } else {
        if (policy.value.matrix[i][j].containsKey("internal")) {
          headline = "Internal-Processing";
          messageA = policy.value.matrix[i][j]["internal"]!.entries
              .where((entry) => entry.value)
              .fold("", (a, b) => "$a ${b.key},");
          if (messageA.isNotEmpty) {
            messageA = messageA.substring(0, messageA.length - 1);
          }
          messageD = policy.value.matrix[i][j]["internal"]!.entries
              .where((entry) => !entry.value)
              .fold("", (a, b) => "$a ${b.key},");
          if (messageD.isNotEmpty) {
            messageD = messageD.substring(0, messageD.length - 1);
          }
        } else {
          return const TextSpan(text: "");
        }
      }
    }
    var textStyle = const TextStyle(
      color: Colors.white,
    );
    return WidgetSpan(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (headline.isNotEmpty)
              Text(
                headline,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            if (messageA.isNotEmpty)
              Wrap(
                children: [
                  SizedBox(
                      width: 65,
                      child: Text(
                        "accepted:",
                        style: textStyle,
                      )),
                  Text(
                    messageA,
                    style: textStyle,
                  ),
                ],
              ),
            if (messageD.isNotEmpty)
              Wrap(
                children: [
                  SizedBox(
                      width: 65,
                      child: Text(
                        "declined:",
                        style: textStyle,
                      )),
                  Text(
                    messageD,
                    style: textStyle,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Color _getCellColor(Rx<Policy> policy, int i, int j) {
    if (policy.value.matrix[i][j].isNotEmpty) {
      if (policy.value.matrix[i][j].containsKey("inside")) {
        return policy.value.matrix[i][j]["inside"]!.entries
                .fold(false, (bool a, b) => a |= b.value)
            ? Colors.green
            : Colors.transparent;
      } else {
        if (policy.value.matrix[i][j].containsKey("outside")) {
          return policy.value.matrix[i][j]["outside"]!.entries
                  .fold(false, (bool a, b) => a |= b.value)
              ? Colors.green
              : Colors.transparent;
        } else {
          return policy.value.matrix[i][j]["internal"]!.entries
                  .fold(false, (bool a, b) => a |= b.value)
              ? Colors.green
              : Colors.transparent;
        }
      }
    }
    return Colors.transparent;
  }

  Widget _getIcon(Rx<Policy> policy, int i, int j) {
    var type = "";
    if (policy.value.matrix[i][j].isNotEmpty) {
      if (policy.value.matrix[i][j].containsKey("inside")) {
        type = "inside";
      } else {
        if (policy.value.matrix[i][j].containsKey("outside")) {
          type = "outside";
        } else {
          type = "internal";
        }
      }
      return VectorGraphic(
        loader: AssetBytesLoader("assets/DaPIS/matrix/$type.svg"),
        semanticsLabel: "Processing $type EU",
        height: 40,
        width: 40,
      );
    } else {
      return Container();
    }
  }

  Widget _getContainer(Rx<Policy> policy, int i, int j) {
    var messageA = "";
    var messageD = "";
    if (policy.value.matrix[i][j].containsKey("inside")) {
      messageA = policy.value.matrix[i][j]["inside"]!.entries
          .where((entry) => entry.value)
          .fold("", (a, b) => "$a ${b.key},");
      if (messageA.isNotEmpty) {
        messageA = messageA.substring(0, messageA.length - 1);
      }
      messageD = policy.value.matrix[i][j]["inside"]!.entries
          .where((entry) => !entry.value)
          .fold("", (a, b) => "$a ${b.key},");
      if (messageD.isNotEmpty) {
        messageD = messageD.substring(0, messageD.length - 1);
      }
    } else {
      if (policy.value.matrix[i][j].containsKey("outside")) {
        messageA = policy.value.matrix[i][j]["outside"]!.entries
            .where((entry) => entry.value)
            .fold("", (a, b) => "$a ${b.key},");
        if (messageA.isNotEmpty) {
          messageA = messageA.substring(0, messageA.length - 1);
        }
        messageD = policy.value.matrix[i][j]["outside"]!.entries
            .where((entry) => !entry.value)
            .fold("", (a, b) => "$a ${b.key},");
        if (messageD.isNotEmpty) {
          messageD = messageD.substring(0, messageD.length - 1);
        }
      } else {
        if (policy.value.matrix[i][j].containsKey("internal")) {
          messageA = policy.value.matrix[i][j]["internal"]!.entries
              .where((entry) => entry.value)
              .fold("", (a, b) => "$a ${b.key},");
          if (messageA.isNotEmpty) {
            messageA = messageA.substring(0, messageA.length - 1);
          }
          messageD = policy.value.matrix[i][j]["internal"]!.entries
              .where((entry) => !entry.value)
              .fold("", (a, b) => "$a ${b.key},");
          if (messageD.isNotEmpty) {
            messageD = messageD.substring(0, messageD.length - 1);
          }
        }
      }
    }
    return Stack(
      alignment: Alignment.center,
      children: [
        if (messageA.isNotEmpty && messageD.isNotEmpty)
          Column(
            children: [
              Container(
                color: _getCellColor(policy, i, j),
                height: 25,
                width: 50,
              ),
              Container(
                color: Colors.amberAccent,
                height: 25,
                width: 50,
              ),
            ],
          )
        else
          Container(
            color: _getCellColor(policy, i, j),
            height: 50,
            width: 50,
          ),
        _getIcon(policy, i, j),
      ],
    );
  }

  Widget _getCell(Rx<Policy> policy, int i, int j) {
    return Tooltip(
      richMessage: _getHoverText(policy, i, j),
      preferBelow: false,
      child: _getContainer(policy, i, j),
    );
  }

  @override
  Widget build(BuildContext context) {
    Rx<Policy> policy = Get.find();
    return Card(
      child: ExpansionTile(
        leading: Tooltip(
          message: AppLocalizations.of(context)!
              .policy_edit_processing_overview_title,
          preferBelow: false,
          child: const VectorGraphic(
            loader: AssetBytesLoader("assets/material/background_grid_small.svg"),
            semanticsLabel: "Processing Overview",
            height: 30,
            width: 30,
          ),
        ),
        title: Text(
          AppLocalizations.of(context)!.policy_edit_processing_overview_title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const Border(),
        childrenPadding: const EdgeInsets.all(20),
        initiallyExpanded: true,
        children: [
          Obx(() {
            var table = Table(
              border: const TableBorder(
                horizontalInside: BorderSide(),
                verticalInside: BorderSide(),
              ),
              columnWidths: const {
                0: FixedColumnWidth(65),
                1: FixedColumnWidth(50),
                2: FixedColumnWidth(50),
                3: FixedColumnWidth(50),
                4: FixedColumnWidth(50),
                5: FixedColumnWidth(50),
                6: FixedColumnWidth(50),
                7: FixedColumnWidth(50),
                8: FixedColumnWidth(50),
                9: FixedColumnWidth(50),
                10: FixedColumnWidth(50),
                11: FixedColumnWidth(50),
                12: FixedColumnWidth(50),
                13: FixedColumnWidth(50),
                14: FixedColumnWidth(50),
              },
              children: [
                TableRow(
                  children: [
                    const Text("Purposes Data"),
                    for (int j = 0; j < Policy.purposeCategoryNames.length; j++)
                      if (policy.value.purposeCategoryVisibility[j])
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Tooltip(
                            message: AppLocalizations.of(context)!
                                .policy_edit_purposes(
                                    Policy.purposeCategoryNames[j]),
                            preferBelow: false,
                            child: VectorGraphic(
                              loader: AssetBytesLoader(
                                  "assets/DaPIS/purpose_categories/${Policy.purposeCategoryNames[j]}.svg"),
                              semanticsLabel: AppLocalizations.of(context)!
                                  .policy_edit_purposes(
                                      Policy.purposeCategoryNames[j]),
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                  ],
                ),
                for (int i = 0; i < Policy.dataCategoryNames.length; i++)
                  if (policy.value.dataCategoryVisibility[i])
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Tooltip(
                            message: AppLocalizations.of(context)!
                                .data_categories(Policy.dataCategoryNames[i]),
                            preferBelow: false,
                            child: VectorGraphic(
                              loader: AssetBytesLoader(
                                  "assets/DaPIS/data_categories/${Policy.dataCategoryNames[i]}.svg"),
                              semanticsLabel: Policy.dataCategoryNames[i],
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                        for (int j = 0;
                            j < Policy.purposeCategoryNames.length;
                            j++)
                          if (policy.value.purposeCategoryVisibility[j])
                            _getCell(policy, i, j),
                      ],
                    ),
              ],
            );
            return table.children.length > 1
                ? table
                : Text(AppLocalizations.of(context)!.matrix_external_empty);
          }),
        ],
      ),
    );
  }
}
