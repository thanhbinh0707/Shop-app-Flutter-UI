import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import '../models/Product.dart';

class ProductService {
  static Future<List> getProducts() async {
    try {
      final response = await ApiService.getRequest("menuitems/all");

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((item) => Product.fromJson(item)).toList();
      } else {
        // Handle different error status codes
        print("API Error: Status code ${response.statusCode}");
        if (response.statusCode == 404) {
          // Resource not found
          throw Exception("Không tìm thấy dữ liệu.");
        } else if (response.statusCode >= 500) {
          // Server error
          throw Exception("Lỗi máy chủ. Vui lòng thử lại sau.");
        } else {
          // Other errors
          throw Exception(
              "Lỗi khi tải dữ liệu. Mã trạng thái: ${response.statusCode}");
        }
      }
    } catch (e) {
      print("Lỗi khi gọi API: $e");
      throw Exception(
          "Lỗi kết nối hoặc lỗi bất ngờ: $e"); // Re-throw the exception
    }
  }

  // static Future<Product?> getProductById(String id) async {
  //   try {
  //     final response = await ApiService.getRequest("products/$id");

  //     if (response.statusCode == 200) {
  //       return Product.fromJson(jsonDecode(response.body));
  //     }
  //   } catch (e) {
  //     print("Lỗi khi gọi API: $e");
  //   }
  //   return null;
  // }

  // static Future<List?> searchProducts(String query) async {
  //   try {
  //     final response = await ApiService.getRequest("products/search/$query");

  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = jsonDecode(response.body);
  //       return data.map((item) => Product.fromJson(item)).toList();
  //     }
  //   } catch (e) {
  //     print("Lỗi khi gọi API: $e");
  //   }
  //   return null;
  // }
}
