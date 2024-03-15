import 'package:flutter/material.dart';

class AddProduct extends StatelessWidget {
  const AddProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final subNameController = TextEditingController();
    final rateController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Product Name"),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Enter product Name"),
            ),
            const SizedBox(height: 24),
            const Text("Sub Name"),
            const SizedBox(height: 8),
            TextField(
              controller: subNameController,
              decoration:
                  const InputDecoration(hintText: "Enter product SubName here"),
            ),
            TextField(
              controller: rateController,
              decoration:
                  const InputDecoration(hintText: "Enter the price here"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Add"),
            )
          ],
        ),
      ),
    );
  }
}
