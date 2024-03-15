import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cured2/model/product_model.dart';
import 'package:cured2/services/firestore_services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
class Product extends _$Product {
  /// this function is to fetch all the products from the firebase db
  /// we use it as the initial state of [productProvider]
  Future<QuerySnapshot<ProductModel>> _fetchProducts() async {
    try {
      final products = await FirestoreServices.getProducts();
      return products;
    } on FirebaseException catch (_) {
      rethrow;
    }
  }

  @override
  FutureOr<QuerySnapshot<ProductModel>> build() {
    return _fetchProducts();
  }

  Future<void> addProduct(ProductModel product) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await FirestoreServices.addProduct(product);
      return _fetchProducts();
    });
  }

  Future<void> updateProduct(ProductModel product, String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await FirestoreServices.updateProduct(product, id);
      return _fetchProducts();
    });
  }

  Future<void> removeProduct(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await FirestoreServices.deleteProduct(id);
      return _fetchProducts();
    });
  }
}
