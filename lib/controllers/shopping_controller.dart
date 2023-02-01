import 'package:counter_and_basics/models/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(const Duration(seconds: 1));
    var productResult = [
      Product(1, 'First Prod', 'abc', 'some description about product', 30),
      Product(2, 'Second Prod', 'abc', 'some description about product', 40),
      Product(3, 'Third Prod', 'abc', 'some description about product', 50),
    ];

    products.value = productResult;
  }
}
