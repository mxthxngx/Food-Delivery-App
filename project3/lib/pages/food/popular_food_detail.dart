import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project3/controllers/cart_controller.dart';
import 'package:project3/controllers/popular_product_controller.dart';
import 'package:project3/pages/cart/cart_page.dart';
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
  final int pageId;
  final String page;
   const PopularFoodDetails({Key? key, required this.pageId,required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());

    return Scaffold(
     // backgroundColor: Colors.grey.shade800,
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

                   Get.toNamed(RouteHelper.getInitial());


               },
               child: AppIcon(icon: Icons.arrow_back_ios,size: Dimensions.iconSize24*2.3,iconColor:AppColors.mainGreen,backgroundColor: AppColors.mainColor,iconSize: Dimensions.iconSize24*1.5,),
          ),
              GetBuilder<PopularProductController>(builder: (controller)
              {
                return Stack(
                  children: [
                    GestureDetector(

                onTap:(){
                  Get.toNamed(RouteHelper.getCartPage(pageId,"popular"));
                },
                        child: AppIcon(icon: Icons.shopping_cart_outlined,
                        iconColor: AppColors.mainGreen,
                          backgroundColor: AppColors.mainColor,
                          size: 40,
                          iconSize: 46,
                        )
                    ),
                    Get.find<PopularProductController>().totalItems>=1?
                    Positioned(
                      right: 0, top: 0,

                        child: AppIcon(icon: Icons.circle,size: 18,iconColor: Colors.transparent,backgroundColor: AppColors.mainGreen,
                        ),

                    ):
                    Container(),
                    Get.find<PopularProductController>().totalItems>=1?
                    Positioned(
                      right: 4.5, top: 3,
                      child: BigText(text:  Get.find<PopularProductController>().totalItems.toString(),
                      size: 11,
                      color: AppColors.mainColor,),
                    ):
                    Container(),
                  ],
                );
              },)


              ]
            ),
          ),
          //introduction of food
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.popularFoodImgSize-40,
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
                    AppColumn(
                        text: product.name!
                    ),

                    SizedBox(height: Dimensions.height20*1.1,),
                    Divider(
                      color: Colors.grey.shade400,
                    ),

                    BigText(text: "Introduction",size: Dimensions.font26/1.03,color: AppColors.mainColor,),
                    SizedBox(height: Dimensions.height20*1.1,),

                    // ExpandableTextWidget(text: product.description,) ,
                    Container(
                        width:MediaQuery.of(context).size.width,
                        height: 100,
                        margin: EdgeInsets.only(bottom: Dimensions.height15),
                        child: Column(
                        children: [
                          Expanded(
                          child:SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: ExpandableTextWidget(text:product.description!,)) ,),
                        ] ))

                    ],
                ),
                ),

          )

        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct) //getbuilder creates an instance of product controller so we can use its functions
        {
          return Container(
            height: Dimensions.height20*5.7,
            margin: EdgeInsets.only(bottom: Dimensions.height15/2,left: Dimensions.width15,right:Dimensions.width15,),
            padding: EdgeInsets.only(top: Dimensions.height20/2,bottom: Dimensions.height20/2,left: Dimensions.width20, right: Dimensions.width20),
         //   padding: EdgeInsets.only(top: Dimensions.height20/2,bottom: Dimensions.height20/2,left: Dimensions.width20, right: Dimensions.width20),
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20),
                bottomLeft: Radius.circular(Dimensions.radius20),
                bottomRight: Radius.circular(Dimensions.radius20),

              ),

            ),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  height: Dimensions.height30*1.7,
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20, ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.grey.shade800,
                  ),
                  child: Row(
                      children:[
                        GestureDetector(
                            onTap:(){
                              popularProduct.setQuantity(false);
            },
                            child: Icon(Icons.remove,color: Colors.white70,)),
                        SizedBox(width: Dimensions.width10,height: 23,),
                        BigText(text: popularProduct.inCartItems.toString(),color: Colors.white70,size: Dimensions.font20*1.35,),
                        SizedBox(width: Dimensions.width10,height: 23,),

                        GestureDetector(
                            onTap:(){
                              popularProduct.setQuantity(true);
                            },
                            child: Icon(Icons.add,color: Colors.white70,))
                      ]
                  ),
                ),
               GestureDetector(
                onTap: (){
                  popularProduct.addItem(product);
                },
                child: Container(
                  height: Dimensions.height30*1.9,
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top:Dimensions.height15*1.1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.buttonColor,
                  ),


                    child: BigText(text: "\$ ${product.price!} | Add to cart", color: AppColors.mainColor,size: Dimensions.font20*1.2)),

                ),

              ],
            ),
          );
        },)
    );
  }
}
