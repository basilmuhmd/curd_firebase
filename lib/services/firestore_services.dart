import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cured2/model/product_model.dart';

class FirestoreServices {
  static final collection =
      FirebaseFirestore.instance.collection("products").withConverter(
            fromFirestore: ProductModel.fromFirestore,
            toFirestore: (product, options) => product.toFirestore(),
          );
  static Future<DocumentReference<ProductModel>> addProduct(
      ProductModel product) {
    return collection.add(product);
  }

  static Future<QuerySnapshot<ProductModel>> getProducts() {
    return collection.get();
  }

  static Future<void> updateProduct(ProductModel product, String id) {
    return collection.doc(id).update(product.toFirestore());
  }

  static Future<void> deleteProduct(String id) {
    return collection.doc(id).delete();
  }
}
