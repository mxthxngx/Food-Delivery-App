import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:project3/routes/route_helper.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin{
 late Animation<double> animation;
 late AnimationController controller;
 Future<void> _loadResources() async
 {

   Get.find<PopularProductController>().getPopularProductList();
   Get.find<RecommendedProductController>().getRecommendedProductList();
 }
 @override
 void initState(){
   super.initState();
   _loadResources();
   print("In splash");
   controller =  AnimationController(
       vsync:  this, 
       duration: const Duration(seconds:2))..forward();
   animation =  CurvedAnimation(parent: controller, curve: Curves.easeInOutCubicEmphasized);
   Timer(
     Duration(seconds: 8),
       ()=>Get.offNamed(RouteHelper.getInitial()
       )
   );
 }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Column(
            children: [
              Image.asset("assets/images/splashscreen.gif",width: Dimensions.splashImg*1.2,height: Dimensions.splashImg*1.2,),
          ScaleTransition(
              scale: animation,
               child:  Image.asset("assets/images/Title.jpg",width: Dimensions.splashImg/2.1,height: 80))
        ],
          )
      )
        ],
      )
    );
  }
}

