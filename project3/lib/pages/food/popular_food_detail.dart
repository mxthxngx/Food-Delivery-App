import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project3/controllers/cart_controller.dart';
import 'package:project3/controllers/popular_product_controller.dart';
import 'package:project3/pages/home/main_home_page.dart';
import 'package:project3/routes/route_helper.dart';
import 'package:project3/utils/constants.dart';
import 'package:project3/utils/dimensions.dart';
import 'package:project3/widgets/app_icon.dart';
import 'package:project3/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
  int pageId;
   PopularFoodDetails({Key? key, required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(Get.find<CartController>());

    return Scaffold(
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
              right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URl+AppConstants.UPLOAD+product.img!
                  ),
                ),
              ),
            ),
          ),
          // icon widgets
          Positioned(
            top: Dimensions.height15*3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                GestureDetector(
            onTap: ()
               {
                 Get.toNamed(RouteHelper.initial);
               },
               child: AppIcon(icon: Icons.arrow_back_ios),
          ),AppIcon(icon: Icons.shopping_cart_outlined)]
            ),
          ),
          //introduction of food
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.popularFoodImgSize-20,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height15*3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.radius20*1.5),
                    topLeft: Radius.circular(Dimensions.radius20*1.5),
                  ),
                    color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduction"),

                        ExpandableTextWidget(text: product.description!,) ,
                    ],
                ),
                ),

          )

        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct) //getbuilder creates an instance of product controller so we can use its functions
        {
          return Container(
            height: Dimensions.height20*6,
            padding: EdgeInsets.only(top: Dimensions.height30,bottom: Dimensions.height20,left: Dimensions.width20, right: Dimensions.width20),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20),

              ),

            ),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  height: Dimensions.height30*3,
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20, bottom: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                      children:[
                        GestureDetector(
                            onTap:(){
                              popularProduct.setQuantity(false);
            },
                            child: Icon(Icons.remove,color: Colors.black45,)),
                        SizedBox(width: Dimensions.width10/2,),
                        BigText(text: popularProduct.quantity.toString()),
                        SizedBox(width: Dimensions.width10/2,),

                        GestureDetector(
                            onTap:(){
                              popularProduct.setQuantity(true);
                            },
                            child: Icon(Icons.add,color: Colors.black45,))
                      ]
                  ),
                ),
                Container(
                  height: Dimensions.height30*3,
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20, bottom: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: GestureDetector(
                      onTap: (){
                        popularProduct.addItem(product);
                      }
                      ,child: BigText(text: "\$ ${product.price!} | Add to cart", color: Colors.white,)),

                ),

              ],
            ),
          );
        },)
    );
  }
}
