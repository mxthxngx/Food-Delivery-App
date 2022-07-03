import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project3/controllers/popular_product_controller.dart';
import 'package:project3/data/api/api_client.dart';
import 'package:project3/data/repository/popular_product_repo.dart';
import 'package:project3/utils/constants.dart';

import '../controllers/recommended_product_controller.dart';
import '../data/repository/recommended_product_repo.dart';

Future<void> init()async {
  //api client
Get.lazyPut(()=>ApiClient(appBaseUrl: AppConstants.BASE_URl));

//repos
Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));//getx will find the apiclient
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));//getx will find the apiclient


  //controllers
  Get.lazyPut(() =>PopularProductController(popularProductRepo: Get.find()));

  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
}