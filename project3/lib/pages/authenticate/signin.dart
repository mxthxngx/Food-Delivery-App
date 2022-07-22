import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project3/services/auth.dart';
import 'package:project3/utils/dimensions.dart';
import 'package:project3/widgets/big_text.dart';
import 'package:project3/widgets/small_text.dart';

import '../../utils/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,

      body: Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.height30*9,horizontal: Dimensions.width40*2),
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height20),
        child: ElevatedButton(
          child: BigText(text: "Sign in anonymously",size: Dimensions.font20,),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFCAF70C)),foregroundColor: MaterialStateProperty.all(AppColors.mainColor),),
          onPressed: ()async{
            dynamic result   = await _auth.signInAnon();
            if(result == null){
              print("Error signing in");
            }
            else{
              print("Signed in");
              print(result.uid);
            }
          },
        ),
      ),
    );
  }
}
