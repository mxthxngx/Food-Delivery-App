import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project3/pages/food/popular_food_detail.dart';
import 'package:project3/pages/food/recommended_food.dart';
import 'package:project3/pages/home/main_home_page.dart';
import 'package:project3/pages/splash/splash_page.dart';
import '../pages/home/home_page.dart';
import '../pages/cart/cart_page.dart';

class RouteHelper
{
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String splashPage="/splash-page";
  static const String cartPage ="/cart-page";
  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId, String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getSplashPage()=>'$splashPage';
  static String getCartPage(int pageId,String page)=>'$cartPage?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page)=>'$recommendedFood?pageId=$pageId&page=$page';
  static List<GetPage> routes = [
    GetPage(name: splashPage, page: ()=>SplashPage()),
    GetPage(name: initial, page: ()=>HomePage()),
    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return RecommendedFoodDetail(pageId:int.parse(pageId!),page:page!);
    }
    ),
    GetPage(name: popularFood, page: ()
  {
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return PopularFoodDetails(pageId:int.parse(pageId!),page:page!);
  },
    transition: Transition.fadeIn
    ),
GetPage(name: cartPage, page: (){
  var pageId = Get.parameters['pageId'];

  var page = Get.parameters['page'];
  return CartPage(pageId:int.parse(pageId!),page:page!);

},
transition:Transition.fadeIn,)
  ];
}