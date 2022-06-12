import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project3/widgets/big_text.dart';
import 'package:project3/widgets/icon_and_text.dart';
import 'package:project3/widgets/small_text.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState((){
        _currPageValue = pageController.page!;
      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();
  }//to make the page controller stop working once we leave the page
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Slider section

         Container(
        height: Dimensions.pageView,
        child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context,position)
            {
              return _buildPageItem(position);
            })
    ),
        new DotsIndicator(
        dotsCount: 5,
        position: _currPageValue,
        decorator: DotsDecorator(
          activeColor: AppColors.mainColor,
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        ),
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.height30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width:Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(text: ".",color:Colors.black26),

              ),
              SizedBox(width: Dimensions.width10,),
              Container(
                child: SmallText(text: "Food pairing",color: Colors.black26)
              )
            ],
          )
        ),
      ],
    );
  }
  Widget _buildPageItem(int index)
  {
    Matrix4 matrix = new Matrix4.identity();
    if(index == _currPageValue.floor())
      {
        var currScale = 1-(_currPageValue - index)*(1-_scaleFactor);
        var curTrans = _height*(1-currScale)/2;

        matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, curTrans, 0);

      }
    else if( index == _currPageValue.floor()+1 ){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var curTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, curTrans, 0);
    }
    else if( index == _currPageValue.floor()-1 ){
      var currScale = _scaleFactor;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var curTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, curTrans, 0);
    }
    else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor), 0);

    }
    return Transform(transform: matrix,
    child: Stack(
      children: [Container(
      height: Dimensions.pageViewContainer,
      margin:  EdgeInsets.only(left: Dimensions.width15,right: Dimensions.width10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius30),
          color: index.isEven?const Color(0xFF69c5df): const Color(0XFF9294cc),
          image: const DecorationImage(
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
            height: Dimensions.pageViewTextContainer,
            margin:  EdgeInsets.only(left: Dimensions.width40,right: Dimensions.width40,bottom: 25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow:  [
                  BoxShadow(color: Colors.grey.shade300,
                  blurRadius: 9.0,
                  offset: Offset(0,3),
                  ),
                  BoxShadow(color: Colors.white,
                      offset: Offset(-5,0)
                  ),
                  BoxShadow(color: Colors.white,
                      offset: Offset(5,0)
                  )
                ]

            ),
          child: Container(
            padding:  EdgeInsets.only(top: Dimensions.height15,left: Dimensions.width15 ,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: "Noodles",color: Colors.black,),
                 SizedBox(height:Dimensions.height10,),
                Row(
                  children: [
                    Wrap(
                    children: List.generate(5,(index)=>Icon(Icons.star,color: AppColors.mainColor,size:15)),
                  ),
                  const SizedBox(width: 10,),
                    SmallText(text: "4.5",color:Colors.blueGrey,),
                    const SizedBox(width: 10,),
                    SmallText(text: "1287",color:Colors.blueGrey,),
                    const SizedBox(width: 10,),
                    SmallText(text: "reviews",color:Colors.blueGrey,)
                  ],
                ),
                 SizedBox(height: Dimensions.height20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    const IconAndText(icon: Icons.circle_sharp, text: "Normal", iconColor: Colors.amber),
                    IconAndText(icon: Icons.location_on, text: "1.75km", iconColor: AppColors.mainColor),
                    const IconAndText(icon: Icons.lock_clock_outlined, text: "1.75km", iconColor: Colors.red),

                  ],
                )

              ],
            ),
          ),

          ),
        )
      ],
    ));
  }}
