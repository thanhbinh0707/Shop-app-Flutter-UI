// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../models/Cart.dart';
// import 'components/cart_card.dart';
// import 'components/check_out_card.dart';

// class CartScreen extends StatefulWidget {
//   static String routeName = "/cart";

//   const CartScreen({super.key});

//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Column(
//           children: [
//             const Text(
//               "Your Cart",
//               style: TextStyle(color: Colors.black),
//             ),
//             Text(
//               "${demoCarts.length} items",
//               style: Theme.of(context).textTheme.bodySmall,
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         child: ListView.builder(
//           itemCount: demoCarts.length,
//           itemBuilder: (context, index) => Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: Dismissible(
//               key: Key(demoCarts[index].product.id.toString()),
//               direction: DismissDirection.endToStart,
//               onDismissed: (direction) {
//                 setState(() {
//                   demoCarts.removeAt(index);
//                 });
//               },
//               background: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFFFE6E6),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Row(
//                   children: [
//                     const Spacer(),
//                     SvgPicture.asset("assets/icons/Trash.svg"),
//                   ],
//                 ),
//               ),
//               child: CartCard(cart: demoCarts[index]),
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: const CheckoutCard(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/Cart.dart';
import 'components/cart_card.dart';
import 'components/check_out_card.dart';
import '../../services/cart_service.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Cart> carts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    try {
      List<Cart>? fetchedCarts =
          (await CartService.getCartItems()).cast<Cart>();
      if (mounted) {
        setState(() {
          carts = fetchedCarts;
          isLoading = false;
        });
      }
    } catch (error) {
      print("Lỗi khi tải giỏ hàng: $error");
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> removeCartItem(int cartId, int index) async {
    try {
      bool success = await CartService.deleteCartItem(cartId);
      if (success) {
        setState(() {
          carts.removeAt(index);
        });
      }
    } catch (error) {
      print("Lỗi khi xóa sản phẩm: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${carts.length} items",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : carts.isEmpty
              ? const Center(child: Text("Giỏ hàng trống"))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                    itemCount: carts.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Dismissible(
                        key: Key(carts[index].id.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          removeCartItem(carts[index].id, index);
                        },
                        background: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE6E6),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              const Spacer(),
                              SvgPicture.asset("assets/icons/Trash.svg"),
                            ],
                          ),
                        ),
                        child: CartCard(cart: carts[index]),
                      ),
                    ),
                  ),
                ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }
}
