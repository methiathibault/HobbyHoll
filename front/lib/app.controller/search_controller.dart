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

   void sortByDate() {
    _results.sort((a, b) {
      DateTime dateA = DateTime.parse(a['release_date']);
      DateTime dateB = DateTime.parse(b['release_date']);
      return dateA.compareTo(dateB);
    });
    notifyListeners();
  }

  // Méthode pour trier par ordre alphabétique
  void sortByAlphabeticalOrder() {
    _results.sort((a, b) {
      String nameA = a['name'].toString().toLowerCase();
      String nameB = b['name'].toString().toLowerCase();
      return nameA.compareTo(nameB);
    });
    notifyListeners();
  }

}