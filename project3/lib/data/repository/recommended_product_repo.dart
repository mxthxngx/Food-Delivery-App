import 'package:get/get.dart';
import 'package:project3/data/api/api_client.dart';
import 'package:project3/utils/constants.dart';
//when you load data from internet use getxservice
//repo calls method from api client
class RecommendedProductRepo extends GetxService{
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});
  //future has type async
  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT);
  }
}