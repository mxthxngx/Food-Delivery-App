
import 'package:get/get.dart';
import 'package:project3/data/repository/popular_product_repo.dart';

import '../data/repository/recommended_product_repo.dart';
import '../models/products_model.dart';

class RecommendedProductController extends GetxController
{
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});
  List<dynamic> _recommendedProductList = [];
  List<dynamic> get recommendedProductList => _recommendedProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;//because _popularProductList is private
  Future<void> getRecommendedProductList() async{
    Response response =  await recommendedProductRepo.getRecommendedProductList();//repo returns a response
    if(response.statusCode == 200){
      print("got product");
      _recommendedProductList =[];
      _recommendedProductList.addAll(Product.fromJson(response.body).products); //convert the json file to a model type
      print(_recommendedProductList);
      _isLoaded = true;
      update();
    }
    else
    {

    }
  }
}