import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ApiService {
  static Future<String> explainMedicine(String medicine) async {
    final url = Uri.parse('$baseUrl/gpt/explain');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'medicine': medicine}),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['explanation'] ?? 'No explanation';
    } else {
      throw Exception('Failed to get explanation');
    }
  }
}
