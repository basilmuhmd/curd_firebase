import 'package:cured2/view/pages/add_product.dart';
import 'package:cured2/view/widget/buttonwidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Product Details",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ButtonWidget(
                btnText: "Add Product",
                btnColor: const Color.fromARGB(255, 3, 200, 23),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddProduct(),
                      ));
                },
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                btnText: "Update Product",
                btnColor: Colors.yellow,
                onTap: () {},
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                btnText: "View Products",
                btnColor: const Color.fromARGB(255, 139, 119, 222),
                onTap: () {},
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                btnText: "Delete Product",
                btnColor: const Color.fromARGB(255, 236, 92, 44),
                onTap: () {},
              )
            ],
          ),
        ));
  }
}
