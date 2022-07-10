
import 'package:project3/models/products_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int?quantity;
  bool?isExist;
  String?time;
  ProductModel?product;

  CartModel(
      {this.id,
        this.name,
        this.price,
        this.img,
        this.quantity,
        this.isExist,
        this.time,
        this.product
        });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
   time = json['time'];
   isExist=json['exist'];
   quantity = json['quantity'];
   product = ProductModel.fromJson(json['product']);
  }
}