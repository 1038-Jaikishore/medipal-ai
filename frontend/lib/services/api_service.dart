import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ApiService {
  /// Fetches an AI generated explanation for [medicine].
  ///
  /// Renamed from `explainMedicine` to better reflect the intent of the
  /// operation. Keeping the old signature would make the call site less
  /// descriptive. This method posts the medicine name to the backend and
  /// returns the explanation text on success.
  static Future<String> getMedicineExplanation(String medicine) async {
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
