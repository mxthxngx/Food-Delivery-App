import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:project3/utils/colors.dart';
import 'package:project3/widgets/big_text.dart';
import 'package:project3/widgets/small_text.dart';

import '../../controllers/cart_controller.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';

class CartHistory extends StatefulWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  State<CartHistory> createState() => _CartHistoryState();
}

class _CartHistoryState extends State<CartHistory> {
  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemsPerOrder = Map();
    for(int i =0; i<getCartHistoryList.length;i++){
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        cartItemsPerOrder.update(getCartHistoryList[i].time!,(value)=>++value);
      }
      else{
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartOrderTimeToList(){
      return cartItemsPerOrder.entries.map((e)=>e.value).toList();
    }
    List<int> orderTimes = cartOrderTimeToList();
    var ListCounter =0;
    return Scaffold(

      body: Column(
        children: [
           Container(
      height: Dimensions.height20*5.7,
        margin: EdgeInsets.only(bottom: Dimensions.height15/2,left: Dimensions.width15,right:Dimensions.width15,top:Dimensions.height30*1.2,),

        padding: EdgeInsets.only(top: Dimensions.height20/2,bottom: Dimensions.height20/2,left: Dimensions.width20),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20),
            topRight: Radius.circular(Dimensions.radius20),
            bottomLeft: Radius.circular(Dimensions.radius20),
            bottomRight: Radius.circular(Dimensions.radius20),

          ),),
           // color: AppColors.mainColor,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "Cart History",color: Colors.white,),
                AppIcon(icon:Icons.shopping_cart_outlined,backgroundColor: Colors.grey.shade800,iconColor: AppColors.mainGreen,),
              ],
            ),
          ),

          Expanded(child: Container(
            margin: EdgeInsets.only(
              top:Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,

            ),
            child: ListView(
              children: [
               //for(int i=0;i<cartItemsPerOrder.length;i++)
                Container(
                  margin: EdgeInsets.only(bottom: Dimensions.height20),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,
                  children: [
                    BigText(text: "05|02|2022"),
                    Row(
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                            children: [
                              SmallText(text: "hi",size:  Dimensions.font20,)
                            ],
                        )
                      ],
                    )
                  ],
                ),
                )
              ],
            ),
          ),)


      ]
    ),
    );
  }
}
