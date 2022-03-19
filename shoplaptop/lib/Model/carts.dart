import 'package:shoplaptop/Model/product.dart';

class Cart {
  int? userId;
  String? productId;
  int? quantity;
  String? updatedAt;
  String? createdAt;
  int? id;
  Product? product;

  Cart(
      {this.userId,
      this.productId,
      this.quantity,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.product});

  Cart.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    productId = json['product_id'].toString();
    quantity = json['quantity'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}
