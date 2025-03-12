import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class ApiLoginService {
  static Future<String?> login(String email, String password) async {
    try {
      final response = await ApiService.postRequest("users/login", {
        "login": email,
        "password": password,
      });

      print("Response Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("User data: $data"); // Kiểm tra dữ liệu user
        return "success"; // Trả về thành công
      } else {
        return null;
      }
    } catch (e) {
      print("Lỗi khi gọi API: $e");
      return null;
    }
  }
}
