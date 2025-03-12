import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "http://127.0.0.1:5201/api"; // Hoặc 10.0.2.2 nếu dùng Android Emulator

  static Future<http.Response> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse("$baseUrl/$endpoint");

    print("🔹 Gửi request đến: $url");
    print("🔹 Dữ liệu gửi đi: ${jsonEncode(data)}");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    print("🔹 Response Code: ${response.statusCode}");
    print("🔹 Response Body: ${response.body}");

    return response;
  }

  static getRequest(String s) {}
}
