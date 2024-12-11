import 'package:flutter/material.dart';
import 'package:front/app.controller/search_controller.dart';
import 'package:front/common_widget/custom_search_bar.dart';
import 'package:front/common_widget/search_results.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _searchController = TextEditingController();
  late final HobbySearchController _searchProvider;

  @override
  void initState() {
    super.initState();
    _searchProvider = HobbySearchController();
    // Load all hobbies when page opens
    _loadAllHobbies();
  }

  Future<void> _loadAllHobbies() async {
    try {
      await _searchProvider.loadAllHobbies();
    } catch (e) {
      print('Error loading hobbies: $e');
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _searchProvider,
      child: Scaffold(
        appBar: AppBar(title: const Text('HobbyHoll')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomSearchBar(
                controller: _searchController,
                onSearch: (query) => query.isEmpty 
                  ? _loadAllHobbies() 
                  : _searchProvider.search(query),
              ),
              const SizedBox(height: 16),
              Expanded(
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
            ],
          ),
        ),
      ),
    );
  }
}