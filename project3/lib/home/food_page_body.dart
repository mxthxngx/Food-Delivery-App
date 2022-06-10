import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project3/widgets/big_text.dart';

import '../utils/colors.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      color:Colors.red,
      child: PageView.builder(
        controller: pageController,
          itemCount: 5,
          itemBuilder: (context,position)
      {
        return _buildPageItem(position);
      })
    );
  }
  Widget _buildPageItem(int index)
  {
    return Stack(
      children: [Container(
      height: 220,
      margin: EdgeInsets.only(left: 15,right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: index.isEven?Color(0xFF69c5df): Color(0XFF9294cc),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/images/noodles.jpg"
              )
          )
      ),
    ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 40,right: 40,bottom: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,

            ),
          child: Container(
            padding: EdgeInsets.only(top: 10,left: 15,right: 15),
            child: Column(
              children: [
                BigText(text: "Noodles",color: Colors.black,),
                SizedBox(height: 10,),
                Row(
                  children: [Wrap(
                    children: List.generate(5,(index)=>Icon(Icons.star,color: AppColors.mainColor,size:15)),
                  )],
                )
              ],
            ),
          ),
          ),
        )
      ],
    );
  }}
