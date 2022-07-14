
import 'package:flutter/cupertino.dart';
import 'package:project3/widgets/small_text.dart';

import '../utils/dimensions.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndText({Key? key,
  required this.icon,
    required this.text,

    required this.iconColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Row(
      children: [
        Icon(icon,color:iconColor,size: Dimensions.iconSize24),
        SizedBox(width: 5,),
        SmallText(text: text,size: Dimensions.font20/1.3,),
      ],
    ));
  }
}
