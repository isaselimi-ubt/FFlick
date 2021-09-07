import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:untitled/constants/controllers.dart';
import 'package:untitled/models/product.dart';
import 'package:untitled/screens/home/widgets/single_product.dart';

class ProductsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() => GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .70,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10,
        children: productsController.products.map((ProductModel product) {
          return SingleProductWidget(product: product,);
        }).toList()));
  }
}
