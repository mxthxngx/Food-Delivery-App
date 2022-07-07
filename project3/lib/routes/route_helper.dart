import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:project3/pages/food/popular_food_detail.dart';
import 'package:project3/pages/food/recommended_food.dart';
import 'package:project3/pages/home/main_home_page.dart';

class RouteHelper
{
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static String getInitial()=>'$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId)=>'$recommendedFood?pageId=$pageId';
  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=>MainFoodPage()),
    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      return RecommendedFoodDetail(pageId:int.parse(pageId!));
    }
    ),
    GetPage(name: popularFood, page: ()
  {
      var pageId = Get.parameters['pageId'];
      return PopularFoodDetails(pageId:int.parse(pageId!));
  },
    transition: Transition.fadeIn
    ),

  ];
}