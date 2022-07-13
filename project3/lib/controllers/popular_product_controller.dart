import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project3/controllers/cart_controller.dart';
import 'package:project3/data/repository/popular_product_repo.dart';
import 'package:project3/utils/colors.dart';

import '../models/cart_model.dart';
import '../models/products_model.dart';
import '../utils/dimensions.dart';

class PopularProductController extends GetxController
{ int _quantity= 0;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems+_quantity;
  late CartController _cart;
  int get quantity{
    return _quantity;
  }
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;//because _popularProductList is private
  Future<void> getPopularProductList() async{
    Response response =  await popularProductRepo.getPopularProductList();//repo returns a response
    if(response.statusCode == 200){
     // print("got product");
      _popularProductList =[];
      _popularProductList.addAll(Product.fromJson(response.body).products); //convert the json file to a model type
      //print(_popularProductList);
      _isLoaded = true;
      update();
    }
    else
      {

      }
  }
  void setQuantity(bool isIncrement){
    if(isIncrement)
      {
        _quantity=checkQuantity(_quantity+1);
        print("incrementing "+_quantity.toString());

      }
    else{
     // print("Decrementing");
      _quantity=checkQuantity(_quantity-1);
    }
    update();
  }
  int checkQuantity(int quantity){
    if((_inCartItems+quantity)<0){
      Get.snackbar("Item Count", "You can't reduce more",
      backgroundColor: AppColors.mainColor);
      if(_inCartItems>0)
        {
          _quantity = _inCartItems;
          return _quantity;
        }
      return 0;
    }
    else if(_inCartItems+quantity>20)
  {
    Get.snackbar("Item Count", "You can't increase more",
        backgroundColor: AppColors.mainColor);
    return 20;
  }
    else{
      return quantity;
    }
  }
  void initProduct(ProductModel product,CartController cart){
    _quantity = 0;
    _cart = cart;
    _inCartItems = 0;
    var exist = false;
    exist = _cart.existInCart(product);
    print(exist.toString());
    if(exist){
      _inCartItems = _cart.getQuantity(product);
    }
    print("quantity in cart is "+_inCartItems.toString() );
    //if exists
    //get from storage
  }

  void addItem(ProductModel product) {
   // if (_quantity > 0)
      {_cart.addItem(product, _quantity);
      _quantity =0;
      _inCartItems=_cart.getQuantity(product);
      Get.snackbar("Item Count", "Item added",
          colorText: AppColors.mainBlackColor,
          isDismissible: true,
          duration: Duration(seconds: 1),
          maxWidth: Dimensions.screenWidth/1.3,
          icon: Icon(
            Icons.check_circle_outline,
            color: Colors.green,
          ),
          progressIndicatorBackgroundColor: AppColors.mainColor
      );
      _cart.items.forEach((key, value) {
     // print("The id is" + value.id.toString() + "The quantity is " +
       //   value.quantity.toString());

    });
  /*}else{
       Get.snackbar("Item Count", "Add atleast one item in the cart!",
           backgroundColor: AppColors.mainColor);
*/
     }
     update();
  }
  int get totalItems{
    return _cart.totalItems;
  }
  List<CartModel> get getItems{
    return _cart.getItems;
  }
}