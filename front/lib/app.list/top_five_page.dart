import 'package:flutter/material.dart';
import 'package:front/app.controller/search_controller.dart';
import 'package:front/common_widget/search_results.dart';
import 'package:provider/provider.dart';

class TopFivePage extends StatefulWidget {
  const TopFivePage({super.key});

  @override
  State<TopFivePage> createState() => _TopFivePageState();
}

class _TopFivePageState extends State<TopFivePage> {
  final List<String> _types = ['Manga', 'Film', 'Série', 'BD', 'Comics', 'Livre'];
  String? _selectedType = 'Livre';
  final _searchProvider = HobbySearchController();

  @override
  void initState() {
    super.initState();
    _searchProvider.loadAllHobbies().then((_) {
      _searchProvider.getTopFiveByType(filterType: _selectedType);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 5 by Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedType,
              decoration: const InputDecoration(
                labelText: 'Select Category',
                border: OutlineInputBorder(),
              ),
              items: _types.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedType = newValue;
                  if (newValue != null) {
                    _searchProvider.getTopFiveByType(filterType: newValue);
                  }
                });
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ChangeNotifierProvider.value(
                value: _searchProvider,
                child: Consumer<HobbySearchController>(
                  builder: (context, controller, _) {
                    return SearchResults(
                      results: controller.results,
                      isLoading: controller.isLoading,
                      error: controller.error,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}