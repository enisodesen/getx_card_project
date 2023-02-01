import 'package:counter_and_basics/controllers/cart_controller.dart';
import 'package:counter_and_basics/controllers/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.teal.shade300,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: shoppingController.products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: SizedBox(
                      height: 100,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            shoppingController
                                                .products[index].productName,
                                            style: const TextStyle(
                                              fontSize: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(shoppingController
                                          .products[index].productDescription),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '\$${shoppingController.products[index].price.toString()}',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            cartController.addToCart(
                                                shoppingController
                                                    .products[index]);
                                          },
                                          child: const Text('Add to Cart')),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Text(
              'Total Amount: \$${cartController.totalPrice.toString()}',
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: Colors.amber,
          icon: const Icon(
            Icons.add_shopping_cart_rounded,
            color: Colors.black,
          ),
          label: Text(
            cartController.cartItems.length.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
