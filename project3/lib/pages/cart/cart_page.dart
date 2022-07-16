import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project3/controllers/cart_controller.dart';
import 'package:project3/controllers/popular_product_controller.dart';
import 'package:project3/pages/home/main_home_page.dart';
import 'package:project3/routes/route_helper.dart';
import 'package:project3/utils/constants.dart';
import 'package:project3/utils/dimensions.dart';
import 'package:project3/widgets/big_text.dart';
import 'package:project3/widgets/small_text.dart';

import '../../controllers/recommended_product_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  late int pageId;
  late String page;
   CartPage({Key? key,required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20*3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:()
                  {

                    if(page == "recommended")
                      {
                        Get.toNamed(RouteHelper.getRecommendedFood(pageId, "cartpage"));
                      }
                    else if(page=="popular"){
                      Get.toNamed(RouteHelper.getPopularFood(pageId, "cartpage"));

                    }
                    else{
                      Get.toNamed(RouteHelper.getInitial());
                    }



    },
                  child: AppIcon(icon:Icons.arrow_back_ios,
                  iconColor:AppColors.mainGreen,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                    size: Dimensions.iconSize24*2,
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(icon:Icons.home_outlined,
                    iconColor:AppColors.mainGreen,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24*2,
                    size: Dimensions.iconSize24*2,

                  ),
                ),
              ],
            ),
          ),
         Positioned(
              top: Dimensions.height20*5,
              left:Dimensions.width20,
              right: Dimensions.width20,
              bottom:0,
              child: Container(
                margin: EdgeInsets.only(top:Dimensions.height15),
                child:MediaQuery.removePadding(
                 context: context,
                 removeTop: true,
                 child:GetBuilder<CartController>(builder: (cartController)
                     {
                       var _cartList = cartController.getItems;
                       return ListView.builder(
                           itemCount: _cartList.length,
                           itemBuilder: (_,index){
                             return Container(
                               decoration: BoxDecoration(
                                 border: Border.all(width: 2, color: Colors.grey.shade300),
                                 borderRadius: BorderRadius.circular(Dimensions.radius20/1.5),

                               ),
                               height: 100,
                               width: double.maxFinite,
                               margin: EdgeInsets.only(bottom:Dimensions.width10),
                               child: Row(
                                 children: [
                                   GestureDetector(
                                     onTap:(){
                                       var popularIndex = Get.find<PopularProductController>()
                                           .popularProductList.indexOf(
                                           _cartList[index].product!);
                                       if(popularIndex>=0){
                                         Get.toNamed(RouteHelper.getPopularFood(popularIndex,"cartpage"));
                                       }
                                       else{
                                         var recommendedIndex = Get.find<RecommendedProductController>()
                                             .recommendedProductList.indexOf(
                                             _cartList[index].product!);
                                         Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex,"cartpage"));

                                       }
                                     },
                                     child: Container(
                                       width: Dimensions.height20*5,
                                       height: Dimensions.height20*5,
                                       padding: EdgeInsets.only(top: Dimensions.height10,bottom: Dimensions.height10,left: Dimensions.height10,right: Dimensions.height10),
                                      margin: EdgeInsets.only(left: Dimensions.height10/2.5,),
                                       decoration: BoxDecoration(
                                         image: DecorationImage(
                                             image: NetworkImage(
                                               AppConstants.BASE_URl+AppConstants.UPLOAD+cartController.getItems[index].img!,
                                             )
                                         ),
                                         borderRadius: BorderRadius.circular(Dimensions.radius20/2),


                                       ),
                                     ),
                                   ),
                                   SizedBox(width: Dimensions.width10,),
                                   Expanded(
                                       child:Container(
                                         height: Dimensions.height20*5,
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                           children: [
                                             BigText(text: cartController.getItems[index].name!,size: 20
                                               ,),
                                             SmallText(text: "Spicy"),
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                               children: [
                                                 BigText(text: "\$ ${cartController.getItems[index].price!}",color: Colors.redAccent,size: Dimensions.font26/1.3,),
                                                 Container(
                                                   height: Dimensions.height30,
                                                   padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10,top: Dimensions.height10,),
                                                   decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                     color: Colors.white,
                                                   ),
                                                   child: Row(
                                                       children:[
                                                         GestureDetector(
                                                             onTap:(){
                                                               cartController.addItem(_cartList[index].product!, -1);
                                                             },
                                                             child: Icon(Icons.remove,color: Colors.black45,size:  Dimensions.font26/1.3,)),
                                                         SizedBox(width: Dimensions.width10/2,),
                                                         BigText(text: _cartList[index].quantity.toString(),size:  Dimensions.font26/1.3,),
                                                         SizedBox(width: Dimensions.width10/2,),

                                                         GestureDetector(
                                                             onTap:(){
                                                               cartController.addItem(_cartList[index].product!, 1);
                                                             },
                                                             child: Icon(Icons.add,color: Colors.black45,size:  Dimensions.font26/1.3,))
                                                       ]
                                                   ),
                                                 ),
                                               ],
                                             )
                                           ],
                                         ),
                                       )
                                   )
                                 ],
                               ),
                             );

                           });
                     }
                 ),
                ),
              ))


        ],
      ),
        bottomNavigationBar: GetBuilder<CartController>(builder: (cartController) //getbuilder creates an instance of product controller so we can use its functions
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

                            //child: Icon(Icons.remove,color: Colors.black45,)),
                       // SizedBox(width: Dimensions.width10/2,),
                     children:[ BigText(text: cartController.totalItems.toString()+" items |\$ ${cartController.totalAmount} ",color: Colors.white70,),
                               ]
                       // SizedBox(width: Dimensions.width10/2,),


                  ),
                ),
                GestureDetector(
                  onTap: (){
                    cartController.addToHistory();
                    print("Tapped inside cart page\n");
                  },
                  child: Container(
                      height: Dimensions.height30*1.9,
                      padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top:Dimensions.height15*1.1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.buttonColor,
                      ),


                      child: BigText(text: "Proceed to pay", color: AppColors.mainColor,size: Dimensions.font20*1.2)),
                ),


              ],

            ),
          );
        },)

    );
  }
}
