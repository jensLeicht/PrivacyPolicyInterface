import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pripocog_privacy_policy_interface/l10n/app_localizations.dart';
import 'package:pripocog_privacy_policy_interface/models/policy/policy.dart';
import 'package:vector_graphics/vector_graphics.dart';

class WorldMap extends StatelessWidget {
  const WorldMap({super.key});

  @override
  Widget build(BuildContext context) {
    final Rx<Policy> policy = Get.find();
    return Obx(() => Card(
          color: Colors.blue.shade900,
          child: Column(
            children: [
              InteractiveViewer(
                maxScale: 8,
                child: SimpleMap(
                  defaultColor: policy.value.countries.contains("*")
                      ? Colors.orange
                      : Colors.grey.shade400,
                  instructions: SMapWorld.instructions,
                  colors: () {
                    Map<String, dynamic>? map = SMapWorldColors().toMap();
                    for (String country in policy.value.countries.toSet()) {
                      map[country.toLowerCase()] = Colors.red;
                    }
                    return map;
                  }(),
                  countryBorder: const CountryBorder(color: Colors.white),
                ),
              ),
              if (policy.value.countries.toSet().isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: policy.value.countries.toSet().map((country) {
                          return Tooltip(
                            message: AppLocalizations.of(context)!
                                .countries(country.replaceAll("*", "_")),
                            preferBelow: false,
                            child: VectorGraphic(
                              loader: AssetBytesLoader(
                                  "assets/flags/${country.toLowerCase().replaceAll("*", "_")}.svg"),
                              height: 30,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
