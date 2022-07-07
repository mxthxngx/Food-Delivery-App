import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project3/controllers/cart_controller.dart';
import 'package:project3/pages/home/main_home_page.dart';
import 'package:project3/utils/constants.dart';
import 'package:project3/utils/dimensions.dart';
import 'package:project3/widgets/big_text.dart';
import 'package:project3/widgets/small_text.dart';

import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

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
                AppIcon(icon:Icons.arrow_back_ios,
                iconColor:Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                GestureDetector(
                  onTap:(){
                    Get.to(()=>MainFoodPage());
                  },
                  child: AppIcon(icon:Icons.home_outlined,
                    iconColor:Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
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
                       return ListView.builder(
                           itemCount: cartController.getItems.length,
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
                                   Container(
                                     width: Dimensions.height20*5,
                                     height: Dimensions.height20*5,
                                     margin: EdgeInsets.only(bottom: Dimensions.height10,),
                                     decoration: BoxDecoration(
                                       image: DecorationImage(
                                           image: NetworkImage(
                                             AppConstants.BASE_URl+AppConstants.UPLOAD+cartController.getItems[index].img!,
                                           )
                                       ),
                                       borderRadius: BorderRadius.circular(Dimensions.radius20),


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
                                             BigText(text: cartController.getItems[index].name!),
                                             SmallText(text: "Spicy"),
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                               children: [
                                                 BigText(text: "\$ ${cartController.getItems[index].price!}",color: Colors.redAccent,),
                                                 Container(
                                                   height: Dimensions.height30,
                                                   padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10,top: Dimensions.height10, bottom: Dimensions.height10),
                                                   decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(Dimensions.radius20),
                                                     color: Colors.white,
                                                   ),
                                                   child: Row(
                                                       children:[
                                                         GestureDetector(
                                                             onTap:(){
                                                               //popularProduct.setQuantity(false);
                                                             },
                                                             child: Icon(Icons.remove,color: Colors.black45,)),
                                                         SizedBox(width: Dimensions.width10/2,),
                                                         // BigText(text: popularProduct.inCartItems.toString()),
                                                         SizedBox(width: Dimensions.width10/2,),

                                                         GestureDetector(
                                                             onTap:(){
                                                               //  popularProduct.setQuantity(true);
                                                             },
                                                             child: Icon(Icons.add,color: Colors.black45,))
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
    );
  }
}
