import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project3/controllers/recommended_product_controller.dart';
import 'package:project3/routes/route_helper.dart';
import 'package:project3/widgets/expandable_text_widget.dart';
import 'package:project3/widgets/small_text.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
   int pageId;

   RecommendedFoodDetail({Key? key,required this.pageId}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            elevation: 0,

            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap:(){
                      Get.toNamed(RouteHelper.getInitial());
      },
                    child: AppIcon(icon: Icons.clear)),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
              color: Colors.grey[40],
              child:Center(
                child:
                BigText(color:Colors.black,text:product.name!, size: Dimensions.font26/1.2,),),
              width: double.maxFinite,

              padding: EdgeInsets.only(top: Dimensions.height10/2,bottom: Dimensions.height10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular((Dimensions.radius20)),
                  ),),

            ),
            ),
            pinned: true,
            backgroundColor: Colors.amberAccent[100],
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                  AppConstants.BASE_URl+AppConstants.UPLOAD+product.img!
                  ,
                  width: double.maxFinite,
                  fit: BoxFit.cover),
            ),
             ),
          SliverToBoxAdapter(

            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget( text: product.description),
            margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),

          ),

              ],
            )
          ),
        ],
    ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20*2.5,
              right: Dimensions.width20*2.5,
              top: Dimensions.height10/2.5,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(iconSize:Dimensions.iconSize24, iconColor: Colors.white,backgroundColor: AppColors.mainColor,icon: Icons.remove),
                BigText(text: "\$ ${product.price!}"+" X "+"0"),
                AppIcon(iconSize:Dimensions.iconSize24, iconColor: Colors.white,backgroundColor: AppColors.mainColor,icon: Icons.add)],
            ),
          ),
          Container(
            height: Dimensions.height20*5.9,
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
                  height: Dimensions.height30*2,
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20, bottom: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Icon(
                          Icons.favorite,
                    color: AppColors.mainColor,
                        ),



                ),
                Container(
                  height: Dimensions.height30*3,
                  padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,top: Dimensions.height20, bottom: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: BigText(text: "\$5.00 | Add to cart", color: Colors.white,),

                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

}
