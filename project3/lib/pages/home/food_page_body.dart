import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project3/controllers/popular_product_controller.dart';
import 'package:project3/models/products_model.dart';
import 'package:project3/pages/food/popular_food_detail.dart';
import 'package:project3/utils/constants.dart';
import 'package:project3/widgets/big_text.dart';
import 'package:project3/widgets/icon_and_text.dart';
import 'package:project3/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';


class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState((){
        _currPageValue = pageController.page!;
      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }//to make the page controller stop working once we leave the page
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider section
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return  popularProducts.isLoaded?Container(
              height: Dimensions.pageView,
              child:  PageView.builder(

                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context,position)
                      {
                        return _buildPageItem(position,popularProducts.popularProductList[position]);
                      }

              ),
          ):CircularProgressIndicator(color: AppColors.mainColor,);

        }),
    GetBuilder<PopularProductController>(builder: (popularProducts) {
    return  DotsIndicator(
      dotsCount: popularProducts.popularProductList.length<=0?1:popularProducts.popularProductList.length,
      position: _currPageValue,
      decorator: DotsDecorator(
        color: AppColors.mainColor,
        activeColor: AppColors.mainGreen,
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
    }
    ),

    //DOTS

        SizedBox(height: Dimensions.height30,),
        //LIST OF FOOD
        Container(
            margin: EdgeInsets.only(left: Dimensions.height30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                BigText(text: "Recommended"),
                SizedBox(width:Dimensions.width10),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(text: ".",color:Colors.black26),

                ),
                SizedBox(width: Dimensions.width10,),
                Container(
                    child: SmallText(text: "Food pairing",color: Colors.black26,size: Dimensions.font20,)
                )
              ],
            )
        ),
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct)
        {
          return recommendedProduct.isLoaded? ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recommendedProduct.recommendedProductList.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getRecommendedFood(index,"home"));
                },
                child: Container(
                  margin: EdgeInsets.only(left:Dimensions.width20,right: Dimensions.width20),
                  child: Row(
                    children: [
                      //Image section
                      Container(
                        width: Dimensions.listViewImgSize,
                        height: Dimensions.listViewImgSize,
                        margin: EdgeInsets.only(bottom: Dimensions.width10),

                        decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius20),
                            color: Colors.grey,
                            image:DecorationImage(
                                fit: BoxFit.cover,
                                image:NetworkImage(
                                    AppConstants.BASE_URl+ AppConstants.UPLOAD+recommendedProduct.recommendedProductList[index].img!

                                )
                            )
                        ),),
                      // Text section
                      Expanded(
                        child: Container(
                          height: Dimensions.listViewImgSize,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(Dimensions.radius20),
                              bottomRight: Radius.circular(Dimensions.radius20),
                            ),
                            color: Colors.grey[100],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: recommendedProduct.recommendedProductList[index].name!),
                                SizedBox(height: Dimensions.height10,),
                                SmallText(text: "With chocolate sauce",),
                                SizedBox(height: Dimensions.height10,),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    IconAndText(icon: Icons.energy_savings_leaf, text: "Vegan", iconColor: Colors.greenAccent),
                                    IconAndText(icon: Icons.location_on, text: "1.75km", iconColor: Colors.blue),
                                    IconAndText(icon: Icons.access_time, text: ".5hrs", iconColor: Colors.teal),

                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );

            },
          ):CircularProgressIndicator(color: AppColors.mainColor,);
        }),

         ],
    );
  }
  Widget _buildPageItem(int index,ProductModel popularProduct)
  {
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor())
      {
        var currScale = 1-(_currPageValue - index)*(1-_scaleFactor);
        var curTrans = _height*(1-currScale)/2;

        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, curTrans, 0);

      }
    else if( index == _currPageValue.floor()+1 ){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var curTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, curTrans, 0);
    }
    else if( index == _currPageValue.floor()-1 ){
      var currScale = _scaleFactor;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var curTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, curTrans, 0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor), 0);

    }
    return Transform(transform: matrix,
    child: Stack(
      children: [
        GestureDetector(
          onTap: (){
            Get.toNamed(RouteHelper.getPopularFood(index,"home"));
          },
          child: Container(

      height: Dimensions.pageViewContainer,
      margin:  EdgeInsets.only(left: Dimensions.width15,right: Dimensions.width10),
      decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius30),
            color: index.isEven?const Color(0xFF69c5df): const Color(0XFF9294cc),
            image:  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstants.BASE_URl+  AppConstants.UPLOAD+popularProduct.img!
                )
            )
      ),
    ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin:  EdgeInsets.only(left: Dimensions.width40,right: Dimensions.width40,bottom: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow:  [
                  BoxShadow(color: Colors.grey.shade300,
                  blurRadius: 9.0,
                  offset: Offset(0,3),
                  ),
                  BoxShadow(color: Colors.white,
                      offset: Offset(-5,0)
                  ),
                  BoxShadow(color: Colors.white,
                      offset: Offset(5,0)
                  )
                ]

            ),
          child: Container(

            padding:  EdgeInsets.only(top: Dimensions.height15,left: Dimensions.width15 ,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: popularProduct.name!,color: Colors.black,),
                 SizedBox(height:Dimensions.height10,),
                Row(
                  children: [
                    Wrap(
                    children: List.generate(5,(index)=>Icon(Icons.star,color: AppColors.mainColor,size:15)),
                  ),
                  const SizedBox(width: 10,),
                    SmallText(text: "4.5",color:Colors.blueGrey,),
                    const SizedBox(width: 10,),
                    SmallText(text: "1287",color:Colors.blueGrey,),
                    const SizedBox(width: 10,),
                    SmallText(text: "reviews",color:Colors.blueGrey,)
                  ],
                ),
                 SizedBox(height: Dimensions.height10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    IconAndText(icon: Icons.energy_savings_leaf, text: "Vegan", iconColor: Colors.greenAccent),
                    IconAndText(icon: Icons.location_on, text: "1.75km", iconColor: Colors.blue),
                    IconAndText(icon: Icons.access_time, text: ".5hrs", iconColor: Colors.teal),


                  ],
                ),


              ],
            ),
          ),

          ),
        )
      ],
    ));
  }}
