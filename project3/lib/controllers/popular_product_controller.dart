import 'dart:ui';

import 'package:get/get.dart';
import 'package:project3/controllers/cart_controller.dart';
import 'package:project3/data/repository/popular_product_repo.dart';
import 'package:project3/utils/colors.dart';

import '../models/products_model.dart';

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
      print("got product");
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
    if(quantity<0){
      Get.snackbar("Item Count", "You can't reduce more",
      backgroundColor: AppColors.mainColor);
      return 0;
    }
    if(quantity>20)
  {
    Get.snackbar("Item Count", "You can't increase more",
        backgroundColor: AppColors.mainColor);
    return 20;
  }
    else{
      return quantity;
    }
  }
  void initProduct(CartController cart){
    _quantity = 0;
    _cart = cart;
    _inCartItems = 0;
    //if exists
    //get from storage
  }

  void addItem(ProductModel product){
     if(_quantity>0) _cart.addItem(product, _quantity);
     else{
       Get.snackbar("Item Count", "Add atleast one item in the cart!",
           backgroundColor: AppColors.mainColor);

     }
  }
}