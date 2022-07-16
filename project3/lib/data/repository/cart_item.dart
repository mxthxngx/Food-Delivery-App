import 'dart:convert';

import 'package:project3/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo
{
 final SharedPreferences sharedPreferences;
 CartRepo({required this.sharedPreferences});

 List<String> cart=[];
 List<String> cartHistory =[];
 void addToCartList(List<CartModel> cartList){
  //sharedPreferences.remove(AppConstants.CART_LIST);
  //sharedPreferences.remove(AppConstants.CART_HISTORY);
var time = DateTime.now().toString();
  cart=[];

  cartList.forEach((element) {
   element.time = time;
   return cart.add(jsonEncode(element));
  });

  sharedPreferences.setStringList(AppConstants.CART_LIST,cart);
  //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
  //getCartList();
 }
/*
The below method is to retrieve the cart list ---- taking a list of strings and converting it into an
object.. opposite of addToCartList
we save the list of strings in carts
then, we convert it to a CartModel by using the fromJson function in CartModel and return it.
 */
 List<CartModel> getCartList(){
  List<String> carts= [];
  if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
   carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
   //print("Inside _____________________________________"+carts.toString());
  }
  List<CartModel> cartList =[];

  carts.forEach((element)=> {
cartList.add( CartModel.fromJson(jsonDecode(element))
)
  });
  return cartList;
 }
 List<CartModel> getCartHistoryList(){
  if(sharedPreferences.containsKey(AppConstants.CART_HISTORY)){
   cartHistory =[];
   cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY)!;
  }
  List<CartModel> cartListHistory = [];
  cartHistory.forEach((element) => cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
  return cartListHistory;
}
void addToCartHistoryList(){
  if(sharedPreferences.containsKey(AppConstants.CART_HISTORY)){
   cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY)!;
  }
  for(int i = 0;i<cart.length;i++){
   //print("history list_______________"+cart[i]);
   cartHistory.add(cart[i]);
  }
  removeCart();
  sharedPreferences.setStringList(AppConstants.CART_HISTORY, cartHistory);
 }
 void removeCart(){
  cart =[];
  sharedPreferences.remove(AppConstants.CART_LIST);

 }
}