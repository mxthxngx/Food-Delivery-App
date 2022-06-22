import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project3/utils/dimensions.dart';
import 'package:project3/widgets/app_icon.dart';
import 'package:project3/widgets/expandable_text_widget.dart';

import '../../utils/colors.dart';
import '../../widgets/app_column.dart';
import '../../widgets/big_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage(
                    "assets/images/icecream.jpg"
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
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
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
                    AppColumn(text: "Ice cream"),
                    SizedBox(height: Dimensions.height20,),
                    BigText(text: "Introduction"),

                        ExpandableTextWidget(text: "This Chocolate Ice Cream recipe starts with a cooked chocolate custard, made from a mixture of cocoa powder, semi sweet chocolate, half-and-half cream, sugar, egg yolks, and vanilla. Now, each ingredient contributes to the ice cream's rich flavor and silky smooth texture. The rich chocolate flavor comes from adding both unsweetened cocoa powder (you can use regular unsweetened or Dutch-processed) and semi sweet (or bittersweet) chocolate. The half-and-half cream (you can use 1 cup (240 ml) cream and 1 cup (240 ml) milk) contributes to the ice cream's rich and creamy flavor and, of course, the sugar provides the sweetness.",) ,
                    ],
                ),
                ),

          )

        ],
      ),
      bottomNavigationBar: Container(
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
                     Icon(Icons.remove,color: Colors.black45,),
                     SizedBox(width: Dimensions.width10/2,),
                     BigText(text: "0"),
                     SizedBox(width: Dimensions.width10/2,),

                     Icon(Icons.add,color: Colors.black45,)
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
                  child: BigText(text: "\$10 | Add to cart", color: Colors.white,),

                  ),

              ],
          ),
      ),
    );
  }
}
