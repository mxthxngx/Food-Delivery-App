import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/auth.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';

class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,

      body: Container(
        margin: EdgeInsets.symmetric(vertical: Dimensions.height30*9,horizontal: Dimensions.width40*2),
        padding: EdgeInsets.symmetric(horizontal: Dimensions.width20,vertical: Dimensions.height20),
        child: ElevatedButton(
          child: BigText(text: "Sign out",size: Dimensions.font20,),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(0xFFCAF70C)),foregroundColor: MaterialStateProperty.all(AppColors.mainColor),),
          onPressed: ()async{
await _auth.SignOut();
          },
        ),
      ),
    );
  }
}
