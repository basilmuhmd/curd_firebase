import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cured2/controller/product_provider.dart';
import 'package:cured2/view/pages/add_product.dart';
import 'package:cured2/view/widget/buttonwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Product Details",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          children: [
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonWidget(
                  btnText: "Add Product",
                  btnColor: const Color.fromARGB(255, 3, 200, 23),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddProduct(),
                        ));
                  },
                ),
                ButtonWidget(
                  btnText: "View Products",
                  btnColor: const Color.fromARGB(255, 139, 119, 222),
                  onTap: () {
                    ref.invalidate(productProvider);
                  },
                ),
              ],
            ),
            const SizedBox(height: 32),
            ref.watch(productProvider).when(
                  data: (data) {
                    if (data.docs.isEmpty) {
                      return const Center(
                        child: Text(
                            "No products found in database, Add a product"),
                      );
                    }
                    return ListView.builder(
                      itemCount: data.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final product = data.docs[index].data();
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text("${index + 1}"),
                            ),
                            title: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Name: ${product.name}"),
                                Text("SubName: ${product.subName}"),
                                Text("Rate: ${product.rate}"),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ButtonWidget(
                                  btnText: 'Update',
                                  btnColor: Colors.amber,
                                  width: 50,
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => AddProduct(
                                            isEdit: true,
                                            name: product.name,
                                            subName: product.subName,
                                            rate: product.rate,
                                            id: product.id,
                                          ),
                                        ));
                                  },
                                ),
                                const SizedBox(width: 8),
                                ButtonWidget(
                                  btnText: 'Delete',
                                  btnColor: Colors.red,
                                  width: 50,
                                  onTap: () {
                                    ref
                                        .read(productProvider.notifier)
                                        .removeProduct(product.id);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                          "${(error is FirebaseException) ? error.message : "An unknown error occured, please retry."},"),
                      IconButton(
                        onPressed: () {
                          ref.invalidate(productProvider);
                        },
                        icon: const Icon(Icons.refresh),
                      ),
                    ],
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
          ],
        ));
  }
}
