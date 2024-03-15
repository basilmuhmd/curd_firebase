import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();
  const factory ProductModel({
    required String id,
    required String name,
    required String subName,
    required int rate,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  factory ProductModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    data['id'] = snapshot.id;
    return ProductModel.fromJson(data);
  }
  Map<String, dynamic> toFirestore() {
    return toJson()..remove('id');
  }
}
