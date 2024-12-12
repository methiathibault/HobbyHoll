import 'package:flutter/material.dart';
import 'package:front/app.list/top_five_page.dart';
import 'package:provider/provider.dart';
import 'package:front/app.controller/search_controller.dart';

enum SortOption {
  all,
  date,
  alphabetical,
  rating
}

class SortSearch extends StatelessWidget {
  const SortSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HobbySearchController>(context, listen: false);
    
    return Row(
      children: [
        const Text("Sort by: "),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownButtonFormField<SortOption>(
            value: SortOption.all, // Set default value
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            items: const [
              DropdownMenuItem(
                value: SortOption.all,
                child: Text('All'),
              ),
              DropdownMenuItem(
                value: SortOption.date,
                child: Text('Date'),
              ),
              DropdownMenuItem(
                value: SortOption.alphabetical,
                child: Text('A-Z'),
              ),
              DropdownMenuItem(
                value: SortOption.rating,
                child: Text('Rating'),
              ),
            ],
            onChanged: (SortOption? value) {
              if (value == null) return;
              
              switch (value) {
                case SortOption.all:
                  controller.loadAllHobbies();
                  break;
                case SortOption.date:
                  controller.sortByDate();
                  break;
                case SortOption.alphabetical:
                  controller.sortByAlphabeticalOrder();
                  break;
                case SortOption.rating:
                  controller.sortByRating();
                  break;
              }
            },
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TopFivePage()),
            );
          },
          child: const Text("Top 5"),
        ),
      ],
    );
  }
}