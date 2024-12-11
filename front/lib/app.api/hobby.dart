import "dart:convert";
import "package:http/http.dart" as http;

class Hobby {
  static String baseUrl = "http://10.0.2.2:3001/api/hobbies";

  static Future<List<dynamic>> getHobbies() async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Failed to load hobbies");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<dynamic> getHobby(String id) async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/$id"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Failed to load hobby");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<List<dynamic>> getHobbiesByName(String name) async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/search/$name"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Failed to load hobby");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<List<dynamic>> getHobbiesByType(String type) async {
    try {
      var response = await http.get(Uri.parse("$baseUrl/search/$type"));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("Failed to load hobby");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
