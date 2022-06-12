import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project3/home/food_page_body.dart';
import 'package:project3/utils/dimensions.dart';
import 'package:project3/widgets/big_text.dart';
import 'package:project3/widgets/small_text.dart';

import '../utils/colors.dart';

class  MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    print("current height is "+ MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body:Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top:55,bottom: 15),
          padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [BigText(text: "Karnataka",color: AppColors.mainColor,),
                  Row(children: [
                    SmallText(text: "Bangalore",color: AppColors.mainBlackColor,),
                    Icon(Icons.arrow_drop_down)
                  ],)
                ],
              ),
              Center(
                child: Container(
                  width:45,
                  height: 45,
                  child:Icon(Icons.search,color: Colors.white,size: Dimensions.iconSize24,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.width15),
                    color: AppColors.mainColor,
                  ),
                ),
              )
            ],
          ),
        ),),
          FoodPageBody(),
        ],
      ));
  }
}
