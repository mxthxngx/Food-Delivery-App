import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project3/widgets/expandable_text_widget.dart';
import 'package:project3/widgets/small_text.dart';

import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class RecommendedFoodDetail extends StatefulWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [

          SliverAppBar(
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
              color: Colors.grey[40],
              child:Center(
                child:
                BigText(color:Colors.black,text:"Burger", size: Dimensions.font26/1.2,),),
              width: double.maxFinite,
              padding: EdgeInsets.only(top: Dimensions.height10/2,bottom: Dimensions.height10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular((Dimensions.radius20)),
                  ),),

            ),
            ),
            pinned: true,
            backgroundColor: Colors.amberAccent[100],
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(("assets/images/burger.jpg"),
                  width: double.maxFinite,
                  fit: BoxFit.cover),
            ),
             ),
          SliverToBoxAdapter(

            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: "hamburger, also called burger, ground beef. The term is applied variously to (1) a patty of ground beef, sometimes caller, ground beef. The term is applied variously to (1) a patty of ground beef, sometimes called hamburg steak, Salisbury steak, or Vienna steak, (2)amburger, also called burger, ground beef. The term is applied variously to (1) a patty of ground beef, sometimes called hamburg steak, Salisbury steak, or Vienna steak, patty of ground beef, sometimes called hamburg steak, Salisbury steak, or Vienna steak, (2)amburger, also called burger, ground beef. The term is applied variously to (1) a patty of ground beef, sometimes called hamburg steak, Salisbury steak, or Vienna steak, (2)amburger, also called burger, ground beef. The term is applied variously to (1) a patty of ground beef, sometimes called hamburg steak, Salisbury steak, or Vienna steak, (2)amburger, also called burger, ground beef. The term is applied variously to (1) a patty of ground beef, sometimes called hamburg steak, Salisbury steak, or Vienna steak, (2)amburger, also called burger, ground beef. The term is applied variously to (1) a patty of ground beef, sometimes called hamburg steak, Salisbury steak, or Vienna steak, (2)amburger, also called burger, ground beef. The term is applied variously to (1) a patty of ground beef, sometimes called hamburg steak, Salisbury steak, or Vienna steak, (2)amburger, also called burger, ground beef. The term is applied variously to (1) a patty of ground beef,"),
            margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),

          ),

              ],
            )
          ),
        ],
    ),
    );
  }
}
