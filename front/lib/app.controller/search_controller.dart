import 'package:flutter/material.dart';
import 'package:front/app.api/hobby.dart';

class HobbySearchController extends ChangeNotifier {
  final List<dynamic> _results = [];
  final Set<int> uniqueIds = {};
  bool _isLoading = false;
  String? _error;
  List<dynamic> _currentResults = [];

  List<dynamic> get results => _currentResults;
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
      _currentResults = List.from(_results);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> search(String query) async {
    if (query.isEmpty) {
      _currentResults = List.from(_results);
      notifyListeners();
      return;
    }

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

      _currentResults = uniqueResults;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void sortByDate() {
    _currentResults.sort((a, b) {
      DateTime dateA = DateTime.parse(a['release_date']);
      DateTime dateB = DateTime.parse(b['release_date']);
      return dateB.compareTo(dateA);
    });
    notifyListeners();
  }

  void sortByAlphabeticalOrder() {
    _currentResults.sort((a, b) {
      String nameA = a['name'].toString().toLowerCase();
      String nameB = b['name'].toString().toLowerCase();
      return nameA.compareTo(nameB);
    });
    notifyListeners();
  }

  void sortByRating() {
    _currentResults.sort((a, b) {
    double ratingA = (a['rating'] is int) ? (a['rating'] as int).toDouble() : a['rating'];
    double ratingB = (b['rating'] is int) ? (b['rating'] as int).toDouble() : b['rating'];
      return ratingB.compareTo(ratingA);
    });
    notifyListeners();
  }

  void getTopFiveByType({String? filterType}) {
    Map<String, List<dynamic>> groupedHobbies = {};
    for (var hobby in _results) {
      String type = hobby['type'];
      if (filterType != null && type != filterType) continue;
      if (!groupedHobbies.containsKey(type)) {
        groupedHobbies[type] = [];
      }
      groupedHobbies[type]!.add(hobby);
    }

    List<dynamic> topHobbies = [];
    groupedHobbies.forEach((type, hobbies) {
      hobbies.sort((a, b) {
        double ratingA = (a['rating'] is int) ? (a['rating'] as int).toDouble() : a['rating'];
        double ratingB = (b['rating'] is int) ? (b['rating'] as int).toDouble() : b['rating'];
        return ratingB.compareTo(ratingA);
      });
      topHobbies.addAll(hobbies.take(5));
    });

    _currentResults = topHobbies;
    notifyListeners();
  }
}