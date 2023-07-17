import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://tu-backend.com/api';

  // Método para realizar una solicitud GET
  static Future<http.Response> getData(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    return await http.get(url);
  }

  // Método para realizar una solicitud POST
  static Future<http.Response> postData(
      String endpoint, Map<String, String> data) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    return await http.post(url, body: data);
  }
}
