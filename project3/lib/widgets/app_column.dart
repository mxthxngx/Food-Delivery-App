import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project3/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,color: AppColors.mainColor,size: Dimensions.font26*1.2,),
        SizedBox(height:Dimensions.height10,),
        Row(
          children: [
            Wrap(
              children: List.generate(5,(index)=>Icon(Icons.star,color: AppColors.mainGreen,  size:Dimensions.height20)),
            ),
            const SizedBox(width: 10,),
            SmallText(text: "4.5",color:Colors.black45,size: Dimensions.font20/1.3,),
            const SizedBox(width: 10,),
            SmallText(text: "1287",color:Colors.black45,size: Dimensions.font20/1.3,),
            const SizedBox(width: 10,),
            SmallText(text: "reviews",color:Colors.black45,size: Dimensions.font20/1.1,)
          ],
        ),
        SizedBox(height: Dimensions.height20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            IconAndText(icon: Icons.energy_savings_leaf, text: "Vegan", iconColor: Colors.greenAccent),
            IconAndText(icon: Icons.location_on, text: "1.75km", iconColor: Colors.blue),
            IconAndText(icon: Icons.access_time, text: ".5hrs", iconColor: Colors.teal),

          ],
        )

      ],
    );
  }
}
