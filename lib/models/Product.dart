import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description;
  final List<String> images;
  final List<Color> colors;
  final double rating, price;
  final bool isFavourite, isPopular;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });

  static fromJson(item) {}
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/product 1 image.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "breathable t-shirt - men shirt",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      const Color(0xFFF6625E),
      const Color(0xFF836DB8),
      const Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
// import 'package:flutter/material.dart';

// class Product {
//   final String id;
//   final String name;
//   final String description;
//   final double price;
//   final String category;
//   final bool isAvailable;
//   final String itemPic;
//   final bool isFavourite;
//   final bool isPopular;
//   final List<Color> colors;

//   Product({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.category,
//     this.isAvailable = false,
//     required this.itemPic,
//     this.isFavourite = false,
//     this.isPopular = false,
//     this.colors = const [], // Default empty list to prevent null issues
//   });

//   // Convert from JSON to Dart object
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['_id'], // API usually returns _id
//       name: json['name'],
//       description: json['description'],
//       price: (json['price'] as num).toDouble(), // Ensuring type safety
//       category: json['category'] ?? '', // Default to empty string if missing
//       itemPic: json['itemPic'] ?? '', // Default to empty string if missing
//       isAvailable: json['isAvailable'] ?? false,
//       isFavourite: json['isFavourite'] ?? false,
//       isPopular: json['isPopular'] ?? false,
//       colors: (json['colors'] as List<dynamic>?)
//               ?.map((color) =>
//                   Color(int.parse(color))) // Convert hex string to Color
//               .toList() ??
//           [], // Default to empty list if null
//     );
//   }

//   // Convert from Dart to JSON for sending to the server
//   Map<String, dynamic> toJson() {
//     return {
//       "_id": id, // Keep consistent with API format
//       "name": name,
//       "description": description,
//       "price": price,
//       "category": category,
//       "itemPic": itemPic,
//       "isAvailable": isAvailable,
//       "isFavourite": isFavourite,
//       "isPopular": isPopular,
//       "colors": colors
//           .map((color) => color.value.toRadixString(16))
//           .toList(), // Convert Color to hex string
//     };
//   }
// }
