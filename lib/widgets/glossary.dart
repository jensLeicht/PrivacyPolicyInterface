import 'package:flutter/material.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../models/policy/policy.dart';

class Glossary extends StatelessWidget {
  const Glossary({super.key});

  @override
  Widget build(BuildContext context) {
    var mobile = MediaQuery.of(context).size.width < 1200;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  if (!mobile)
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Column(
                            // Categories of Data
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Tooltip(
                                      message: AppLocalizations.of(context)!
                                          .policy_edit_processing_overview_title,
                                      preferBelow: false,
                                      child: const VectorGraphic(
                                        loader: AssetBytesLoader(
                                            "assets/material/background_grid_small.svg"),
                                        semanticsLabel: "Processing Overview",
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!
                                                .policy_edit_processing_overview_title,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text(
                                            ": Categories of Data",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: Table(
                                  border: const TableBorder(
                                    top: BorderSide(),
                                    bottom: BorderSide(),
                                    horizontalInside: BorderSide(),
                                    verticalInside: BorderSide(),
                                  ),
                                  columnWidths: const {
                                    0: FixedColumnWidth(65),
                                    1: FlexColumnWidth(),
                                  },
                                  children: [
                                    const TableRow(
                                      children: [
                                        Text("Icon",
                                            textAlign: TextAlign.center),
                                        Text("Explanation",
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                    for (int i = 0;
                                        i < Policy.dataCategoryNames.length;
                                        i++)
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Tooltip(
                                              message: AppLocalizations.of(
                                                      context)!
                                                  .data_categories(Policy
                                                      .dataCategoryNames[i]),
                                              preferBelow: false,
                                              child: VectorGraphic(
                                                loader: AssetBytesLoader(
                                                    "assets/DaPIS/data_categories/${Policy.dataCategoryNames[i]}.svg"),
                                                semanticsLabel:
                                                    Policy.dataCategoryNames[i],
                                                height: 40,
                                                width: 40,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .data_categories(Policy
                                                      .dataCategoryNames[i]),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            // Purposes of Processing
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Tooltip(
                                      message: AppLocalizations.of(context)!
                                          .policy_edit_processing_overview_title,
                                      preferBelow: false,
                                      child: const VectorGraphic(
                                        loader: AssetBytesLoader(
                                            "assets/material/background_grid_small.svg"),
                                        semanticsLabel: "Processing Overview",
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!
                                                .policy_edit_processing_overview_title,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text(
                                            ": Purposes of Processing",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: Table(
                                  border: const TableBorder(
                                    top: BorderSide(),
                                    bottom: BorderSide(),
                                    horizontalInside: BorderSide(),
                                    verticalInside: BorderSide(),
                                  ),
                                  columnWidths: const {
                                    0: FixedColumnWidth(65),
                                    1: FlexColumnWidth(),
                                  },
                                  children: [
                                    const TableRow(
                                      children: [
                                        Text("Icon",
                                            textAlign: TextAlign.center),
                                        Text("Explanation",
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                    for (int i = 0;
                                        i < Policy.purposeCategoryNames.length;
                                        i++)
                                      TableRow(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Tooltip(
                                              message: AppLocalizations.of(
                                                      context)!
                                                  .policy_edit_purposes(Policy
                                                      .purposeCategoryNames[i]),
                                              preferBelow: false,
                                              child: VectorGraphic(
                                                loader: AssetBytesLoader(
                                                    "assets/DaPIS/purpose_categories/${Policy.purposeCategoryNames[i]}.svg"),
                                                semanticsLabel: Policy
                                                    .purposeCategoryNames[i],
                                                height: 40,
                                                width: 40,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .policy_edit_purposes(Policy
                                                      .purposeCategoryNames[i]),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            // Processing Locations
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Tooltip(
                                      message: AppLocalizations.of(context)!
                                          .policy_edit_processing_overview_title,
                                      preferBelow: false,
                                      child: const VectorGraphic(
                                        loader: AssetBytesLoader(
                                            "assets/material/background_grid_small.svg"),
                                        semanticsLabel: "Processing Overview",
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!
                                                .policy_edit_processing_overview_title,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text(
                                            ": Processing Locations",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: Table(
                                  border: const TableBorder(
                                    top: BorderSide(),
                                    bottom: BorderSide(),
                                    horizontalInside: BorderSide(),
                                    verticalInside: BorderSide(),
                                  ),
                                  columnWidths: const {
                                    0: FixedColumnWidth(65),
                                    1: FlexColumnWidth(),
                                  },
                                  children: const [
                                    TableRow(
                                      children: [
                                        Text("Icon",
                                            textAlign: TextAlign.center),
                                        Text("Explanation",
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                    TableRow(
                                      // Internal-Processing
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Tooltip(
                                            message: "Internal-Processing",
                                            preferBelow: false,
                                            child: VectorGraphic(
                                              loader: AssetBytesLoader(
                                                  "assets/DaPIS/matrix/internal.svg"),
                                              semanticsLabel:
                                                  "internal processing",
                                              height: 40,
                                              width: 40,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Internal-Processing",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      // EU-Processing
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Tooltip(
                                            message: "EU-Processing",
                                            preferBelow: false,
                                            child: VectorGraphic(
                                              loader: AssetBytesLoader(
                                                  "assets/DaPIS/matrix/inside.svg"),
                                              semanticsLabel: "EU-Processing",
                                              height: 40,
                                              width: 40,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "EU-Processing",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      // Non-EU-Processing
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(5),
                                          child: Tooltip(
                                            message: "Non-EU-Processing",
                                            preferBelow: false,
                                            child: VectorGraphic(
                                              loader: AssetBytesLoader(
                                                  "assets/DaPIS/matrix/outside.svg"),
                                              semanticsLabel:
                                                  "Non-EU-Processing",
                                              height: 40,
                                              width: 40,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Non-EU-Processing",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Colors
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 8, top: 50),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Tooltip(
                                      message: AppLocalizations.of(context)!
                                          .policy_edit_processing_overview_title,
                                      preferBelow: false,
                                      child: const VectorGraphic(
                                        loader: AssetBytesLoader(
                                            "assets/material/background_grid_small.svg"),
                                        semanticsLabel: "Processing Overview",
                                        height: 30,
                                        width: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Row(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)!
                                                .policy_edit_processing_overview_title,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Text(
                                            ": Cell Colours",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 300,
                                child: Table(
                                  border: const TableBorder(
                                    top: BorderSide(),
                                    bottom: BorderSide(),
                                    horizontalInside: BorderSide(),
                                    verticalInside: BorderSide(),
                                  ),
                                  columnWidths: const {
                                    0: FixedColumnWidth(65),
                                    1: FlexColumnWidth(),
                                  },
                                  children: [
                                    const TableRow(
                                      children: [
                                        Text("Color",
                                            textAlign: TextAlign.center),
                                        Text("Explanation",
                                            textAlign: TextAlign.center),
                                      ],
                                    ),
                                    TableRow(
                                      // Internal-Processing
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Container(
                                            color: Colors.transparent,
                                            height: 40,
                                            width: 40,
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Not Selected",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      // EU-Processing
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              color: Colors.green,
                                              height: 25,
                                            ),
                                            Container(
                                              color: Colors.amberAccent,
                                              height: 25,
                                            ),
                                          ],
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Partially Selected",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    TableRow(
                                      // Non-EU-Processing
                                      children: [
                                        Container(
                                          color: Colors.green,
                                          height: 50,
                                          width: 50,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Fully Selected",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ]),
                  if (mobile)
                    Wrap(runSpacing: 40, children: [
                      Column(
                        // Categories of Data
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Tooltip(
                                  message: AppLocalizations.of(context)!
                                      .policy_edit_processing_overview_title,
                                  preferBelow: false,
                                  child: const VectorGraphic(
                                    loader: AssetBytesLoader(
                                        "assets/material/background_grid_small.svg"),
                                    semanticsLabel: "Processing Overview",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .policy_edit_processing_overview_title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        ": Categories of Data",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Table(
                              border: const TableBorder(
                                top: BorderSide(),
                                bottom: BorderSide(),
                                horizontalInside: BorderSide(),
                                verticalInside: BorderSide(),
                              ),
                              columnWidths: const {
                                0: FixedColumnWidth(65),
                                1: FlexColumnWidth(),
                              },
                              children: [
                                const TableRow(
                                  children: [
                                    Text("Icon", textAlign: TextAlign.center),
                                    Text("Explanation",
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                for (int i = 0;
                                    i < Policy.dataCategoryNames.length;
                                    i++)
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Tooltip(
                                          message: AppLocalizations.of(context)!
                                              .data_categories(
                                                  Policy.dataCategoryNames[i]),
                                          preferBelow: false,
                                          child: VectorGraphic(
                                            loader: AssetBytesLoader(
                                                "assets/DaPIS/data_categories/${Policy.dataCategoryNames[i]}.svg"),
                                            semanticsLabel:
                                                Policy.dataCategoryNames[i],
                                            height: 40,
                                            width: 40,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .data_categories(
                                                  Policy.dataCategoryNames[i]),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        // Purposes of Processing
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Tooltip(
                                  message: AppLocalizations.of(context)!
                                      .policy_edit_processing_overview_title,
                                  preferBelow: false,
                                  child: const VectorGraphic(
                                    loader: AssetBytesLoader(
                                        "assets/material/background_grid_small.svg"),
                                    semanticsLabel: "Processing Overview",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .policy_edit_processing_overview_title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        ": Purposes of Processing",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Table(
                              border: const TableBorder(
                                top: BorderSide(),
                                bottom: BorderSide(),
                                horizontalInside: BorderSide(),
                                verticalInside: BorderSide(),
                              ),
                              columnWidths: const {
                                0: FixedColumnWidth(65),
                                1: FlexColumnWidth(),
                              },
                              children: [
                                const TableRow(
                                  children: [
                                    Text("Icon", textAlign: TextAlign.center),
                                    Text("Explanation",
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                for (int i = 0;
                                    i < Policy.purposeCategoryNames.length;
                                    i++)
                                  TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: Tooltip(
                                          message: AppLocalizations.of(context)!
                                              .policy_edit_purposes(Policy
                                                  .purposeCategoryNames[i]),
                                          preferBelow: false,
                                          child: VectorGraphic(
                                            loader: AssetBytesLoader(
                                                "assets/DaPIS/purpose_categories/${Policy.purposeCategoryNames[i]}.svg"),
                                            semanticsLabel:
                                                Policy.purposeCategoryNames[i],
                                            height: 40,
                                            width: 40,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .policy_edit_purposes(Policy
                                                  .purposeCategoryNames[i]),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        // Processing Locations
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Tooltip(
                                  message: AppLocalizations.of(context)!
                                      .policy_edit_processing_overview_title,
                                  preferBelow: false,
                                  child: const VectorGraphic(
                                    loader: AssetBytesLoader(
                                        "assets/material/background_grid_small.svg"),
                                    semanticsLabel: "Processing Overview",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .policy_edit_processing_overview_title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        ": Processing Locations",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Table(
                              border: const TableBorder(
                                top: BorderSide(),
                                bottom: BorderSide(),
                                horizontalInside: BorderSide(),
                                verticalInside: BorderSide(),
                              ),
                              columnWidths: const {
                                0: FixedColumnWidth(65),
                                1: FlexColumnWidth(),
                              },
                              children: const [
                                TableRow(
                                  children: [
                                    Text("Icon", textAlign: TextAlign.center),
                                    Text("Explanation",
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                TableRow(
                                  // Internal-Processing
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Tooltip(
                                        message: "Internal-Processing",
                                        preferBelow: false,
                                        child: VectorGraphic(
                                          loader: AssetBytesLoader(
                                              "assets/DaPIS/matrix/internal.svg"),
                                          semanticsLabel: "internal processing",
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Internal-Processing",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  // EU-Processing
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Tooltip(
                                        message: "EU-Processing",
                                        preferBelow: false,
                                        child: VectorGraphic(
                                          loader: AssetBytesLoader(
                                              "assets/DaPIS/matrix/inside.svg"),
                                          semanticsLabel: "EU-Processing",
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "EU-Processing",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  // Non-EU-Processing
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Tooltip(
                                        message: "Non-EU-Processing",
                                        preferBelow: false,
                                        child: VectorGraphic(
                                          loader: AssetBytesLoader(
                                              "assets/DaPIS/matrix/outside.svg"),
                                          semanticsLabel: "Non-EU-Processing",
                                          height: 40,
                                          width: 40,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Non-EU-Processing",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Colors
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8, top: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Tooltip(
                                  message: AppLocalizations.of(context)!
                                      .policy_edit_processing_overview_title,
                                  preferBelow: false,
                                  child: const VectorGraphic(
                                    loader: AssetBytesLoader(
                                        "assets/material/background_grid_small.svg"),
                                    semanticsLabel: "Processing Overview",
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .policy_edit_processing_overview_title,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        ": Cell Colours",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 300,
                            child: Table(
                              border: const TableBorder(
                                top: BorderSide(),
                                bottom: BorderSide(),
                                horizontalInside: BorderSide(),
                                verticalInside: BorderSide(),
                              ),
                              columnWidths: const {
                                0: FixedColumnWidth(65),
                                1: FlexColumnWidth(),
                              },
                              children: [
                                const TableRow(
                                  children: [
                                    Text("Color", textAlign: TextAlign.center),
                                    Text("Explanation",
                                        textAlign: TextAlign.center),
                                  ],
                                ),
                                TableRow(
                                  // Internal-Processing
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                        color: Colors.transparent,
                                        height: 40,
                                        width: 40,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Not Selected",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  // EU-Processing
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          color: Colors.green,
                                          height: 25,
                                        ),
                                        Container(
                                          color: Colors.amberAccent,
                                          height: 25,
                                        ),
                                      ],
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Partially Selected",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  // Non-EU-Processing
                                  children: [
                                    Container(
                                      color: Colors.green,
                                      height: 50,
                                      width: 50,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Fully Selected",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ]),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Close")),
          ),
        ],
      ),
    );
  }
}
