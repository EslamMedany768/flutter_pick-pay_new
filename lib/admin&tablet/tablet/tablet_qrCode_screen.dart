import 'package:flutter/material.dart';
import 'package:graduation_project/admin&tablet/tablet/tablet_screen.dart';

class TabletQrcodeScreen extends StatelessWidget {
  static const String routeName = "TabletQrcodeScreen";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(TabletScreen.routeName);
          },
          child: Image.asset(
            width: width * 0.8,
            "assets/images/QR_code.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
