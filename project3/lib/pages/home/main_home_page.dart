import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project3/pages/home/food_page_body.dart';
import 'package:project3/utils/dimensions.dart';
import 'package:project3/widgets/big_text.dart';
import 'package:project3/widgets/small_text.dart';

import '../../utils/colors.dart';

class  MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
   // print("current height is "+ MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body:
     Container(
        margin: EdgeInsets.only(top: Dimensions.height15*3,left: Dimensions.width15,right:Dimensions.width15),
         child: Column(
           children: [
             Container(
               //color: AppColors.mainColor,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(
                     bottomLeft:Radius.circular(Dimensions.width15*2),
                     bottomRight:Radius.circular(Dimensions.width15*2),
                 topRight: Radius.circular(Dimensions.width15*2),
                 topLeft: Radius.circular(Dimensions.width15*2),
                 ),

                 color: AppColors.mainColor,
               ),
               child: Container(

                 margin: EdgeInsets.only(top:20,bottom: 15),
                 padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       children: [
                         BigText(text: "Karnataka",color: Colors.white,size: Dimensions.font20*1.1,),
                         Row(children: [
                           SmallText(text: "Bangalore",color: Colors.white,size: Dimensions.font20/1.2,),
                           Icon(Icons.arrow_drop_down,color: AppColors.mainGreen,)
                         ],)
                       ],
                     ),
                     Center(
                       child: Container(
                         width:45,
                         height: 45,
                         child:Icon(Icons.search,color: AppColors.mainGreen,size: Dimensions.iconSize24,),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(Dimensions.width15),
                           border:Border.all(
                               color: AppColors.mainGreen
                           ),
                           color: AppColors.mainColor,
                         ),
                       ),
                     )
                   ],
                 ),
               ),),
             Expanded(child: SingleChildScrollView(

                 child: Column(
                   children: [
                     SizedBox(height: 30,),
                     FoodPageBody(),
                   ],
                 )
             ),),
           ],
         )
     ));
  }
}
