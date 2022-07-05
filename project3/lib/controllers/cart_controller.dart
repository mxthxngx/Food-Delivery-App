import 'package:get/get.dart';
import 'package:project3/models/products_model.dart';

import '../data/repository/cart_item.dart';
import '../models/cart_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items={};
  void addItem(ProductModel product, int quantity){

    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value)  {
        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity!+quantity,
            isExist: true,
            time: DateTime.now().toString()
      );
      }
      );
    }
    else{

    }
    _items.putIfAbsent(product.id!, () {
      print("Adding item to cart" + product.id!.toString() + "\t"+quantity.toString());

      return CartModel(

          id: product.id,
          name: product.name,
          price: product.price,
          img: product.img,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString()
      );
    }
    );
    print("Length of item is ${_items.length}");

  }
    } //checks if the key is inserted in the map
