// import 'package:flutter/material.dart';
// import 'package:shop_app/components/product_card.dart';
// import 'package:shop_app/models/Product.dart';

// import '../details/details_screen.dart';

// class ProductsScreen extends StatelessWidget {
//   const ProductsScreen({super.key});

//   static String routeName = "/products";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Products"),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: GridView.builder(
//             itemCount: demoProducts.length,
//             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//               maxCrossAxisExtent: 200,
//               childAspectRatio: 0.7,
//               mainAxisSpacing: 20,
//               crossAxisSpacing: 16,
//             ),
//             itemBuilder: (context, index) => ProductCard(
//               product: demoProducts[index],
//               onPress: () => Navigator.pushNamed(
//                 context,
//                 DetailsScreen.routeName,
//                 arguments:
//                     ProductDetailsArguments(product: demoProducts[index]),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/services/product_service.dart';

import '../details/details_screen.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  static String routeName = "/products";

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> products = []; // Danh sách sản phẩm từ API
  bool isLoading = true;

  get ProductService => null; // Trạng thái tải dữ liệu

  @override
  void initState() {
    super.initState();
    fetchProducts(); // Gọi API khi màn hình load
  }

  Future<void> fetchProducts() async {
    try {
      List<Product> fetchedProducts = await ProductService.getProducts();
      if (mounted) {
        setState(() {
          products = fetchedProducts;
          isLoading = false;
        });
      }
    } catch (error) {
      print("Lỗi khi tải sản phẩm: $error");
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: isLoading
              ? const Center(child: CircularProgressIndicator()) // Loading
              : products.isEmpty
                  ? const Center(child: Text("Không có sản phẩm nào"))
                  : GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) => ProductCard(
                        product: products[index],
                        onPress: () => Navigator.pushNamed(
                          context,
                          DetailsScreen.routeName,
                          arguments:
                              ProductDetailsArguments(product: products[index]),
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
