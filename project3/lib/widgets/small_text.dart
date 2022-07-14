
import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {
  Color? color;//optional color
  final String text;
  double size;
  double height;
  SmallText({Key? key, this.color = const Color(0xFF989898), required this.text,
    this.size = 13,
    this.height = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: "San Francisco",
        fontWeight: FontWeight.w200,
        fontSize: size,
        height: height,
      ),
    );
  }
}
