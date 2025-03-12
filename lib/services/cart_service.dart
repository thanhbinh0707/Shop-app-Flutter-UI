import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Cart.dart';

class CartService {
  static const String baseUrl =
      "http://127.0.0.1:5201/api/cart"; // Cập nhật đúng API

  // Lấy danh sách giỏ hàng từ API
  static Future<List> getCartItems() async {
    try {
      final response = await http.get(Uri.parse("$baseUrl/items"));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Cart.fromJson(json)).toList();
      } else {
        throw Exception("Lỗi khi tải giỏ hàng: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối API: $e");
    }
  }

  // Xóa một sản phẩm khỏi giỏ hàng
  static Future<bool> deleteCartItem(int cartId) async {
    try {
      final response = await http.delete(Uri.parse("$baseUrl/delete/$cartId"));

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception("Lỗi khi xóa sản phẩm: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Lỗi kết nối API: $e");
    }
  }
}
