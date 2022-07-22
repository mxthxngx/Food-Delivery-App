import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project3/pages/home/home_page.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import 'authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User1?>(context);
  print(user);
    //returns either home or authenticate widget
    if(user==null)
    return Authenticate();

    else{
      return HomePage();
    }
  }
}
