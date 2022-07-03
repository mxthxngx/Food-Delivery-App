import 'package:get/get.dart';
import 'package:project3/data/repository/popular_product_repo.dart';

import '../models/products_model.dart';

class PopularProductController extends GetxController
{
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
}