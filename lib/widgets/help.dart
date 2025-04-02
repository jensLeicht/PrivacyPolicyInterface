import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("WIP"),
        OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Close"))
      ],
    );
  }
}
