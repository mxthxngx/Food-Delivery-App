import 'package:get/get.dart';
import 'package:project3/data/api/api_client.dart';
import 'package:project3/utils/constants.dart';
//when you load data from internet use getxservice
//repo calls method from api client
class PopularProductRepo extends GetxService{
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

 //future has type async
  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT);
  }
}