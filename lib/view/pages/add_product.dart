import 'package:cured2/controller/product_provider.dart';
import 'package:cured2/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddProduct extends ConsumerWidget {
  final bool isEdit;
  final String? name;
  final String? subName;
  final int? rate;
  final String? id;
  AddProduct({
    super.key,
    this.isEdit = false,
    this.name,
    this.subName,
    this.rate,
    this.id,
  });

  final nameController = TextEditingController();
  final subNameController = TextEditingController();
  final rateController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isEdit) {
      nameController.text = name!;
      subNameController.text = subName!;
      rateController.text = rate.toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("${isEdit ? "Edit" : "Add"} Product"),
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
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration:
                  const InputDecoration(hintText: "Enter the price here"),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    subNameController.text.isNotEmpty &&
                    rateController.text.isNotEmpty) {
                  if (isEdit) {
                    ref.read(productProvider.notifier).updateProduct(
                        ProductModel(
                            id: '',
                            name: nameController.text,
                            subName: subNameController.text,
                            rate: int.tryParse(rateController.text) ?? 0),
                        id!);
                  } else {
                    ref.read(productProvider.notifier).addProduct(
                          ProductModel(
                              id: '',
                              name: nameController.text,
                              subName: subNameController.text,
                              rate: int.tryParse(rateController.text) ?? 0),
                        );
                  }
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("All fields are required")));
                }
              },
              child: Text(isEdit ? "Edit" : "Add"),
            )
          ],
        ),
      ),
    );
  }
}
