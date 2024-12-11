import 'package:flutter/material.dart';
import 'package:front/app.controller/search_controller.dart';
import 'package:provider/provider.dart';

class SortSearch extends StatelessWidget {
  const SortSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HobbySearchController>(context, listen: false);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text("Sort by: "),
        ElevatedButton(
          onPressed: () {
            controller.sortByDate();  // Trie par date
          },
          child: const Text("Date"),
        ),
        ElevatedButton(
          onPressed: () {
            controller.sortByAlphabeticalOrder();  // Trie par ordre alphabétique
          },
          child: const Text("Alphabetical Order"),
        ),
      ],
    );
  }
}