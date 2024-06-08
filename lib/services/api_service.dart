import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl =
      'https://exam-server-7c41747804bf.herokuapp.com';

  static Future<List<Map<String, dynamic>>> getCarsList() async {
    final response = await http.get(Uri.parse('$baseUrl/carsList'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load cars list');
    }
  }

  static Future<List<Map<String, dynamic>>> getFilteredCars(
      String type, String model) async {
    final carsList = await getCarsList();
    return carsList.where((car) {
      return car['type'].toString().toLowerCase() == type.toLowerCase() &&
          car['model'].toString().toLowerCase() == model.toLowerCase();
    }).map((car) {
      // Include hourly, daily, and weekly rates in the filtered car objects
      return {
        'id': car['id'],
        'make': car['make'],
        'model': car['model'],
        'year': car['year'],
        'type': car['type'],
        'seats': car['seats'],
        'bags': car['bags'],
        'features': car['features'],
        'hourlyRate': car['rates']['hourly'],
        'dailyRate': car['rates']['daily'],
        'weeklyRate': car['rates']['weekly'],
        'imageURL': car['imageURL'],
      };
    }).toList();
  }
}
