import 'package:flutter/material.dart';
import 'package:front/app.api/hobby.dart';

class HobbySearchController extends ChangeNotifier {
  final List<dynamic> _results = [];
  final Set<int> uniqueIds = {};
  bool _isLoading = false;
  String? _error;

  List<dynamic> get results => _results;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadAllHobbies() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final hobbies = await Hobby.getHobbies();
      _results.clear();
      _results.addAll(hobbies);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> search(String query) async {
    if (query.isEmpty) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final results = await Future.wait([
        Hobby.getHobbiesByName(query),
        Hobby.getHobbiesByType(query),
      ]);

      final Set<int> uniqueIds = {};
      final List<dynamic> uniqueResults = [];

      for (var resultList in results) {
        for (var hobby in resultList) {
          if (!uniqueIds.contains(hobby['id'])) {
            uniqueIds.add(hobby['id']);
            uniqueResults.add(hobby);
          }
        }
      }

      _results.clear();
      _results.addAll(uniqueResults);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}