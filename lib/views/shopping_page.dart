import 'package:counter_and_basics/controllers/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  final shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade300,
      body: Column(
        children: [
          Expanded(
              child: Obx(
            () => ListView.builder(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        onPressed: () {},
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
          )),
          const Text('Total Amount'),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
