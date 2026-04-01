import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/admin&tablet/admin/ui/admin_screen.dart';
import 'package:graduation_project/admin&tablet/admin/ui/delete_screen/delete_screen.dart';
import 'package:graduation_project/admin&tablet/tablet/tablet_qrCode_screen.dart';
import 'package:graduation_project/admin&tablet/tablet/tablet_screen.dart';
import 'package:graduation_project/auth/login_screen.dart';
import 'package:graduation_project/auth/register_screen.dart';
import 'package:graduation_project/di/di.dart';


import 'admin&tablet/admin/ui/add_screen/add_screen.dart';
import 'features/ui/home_screen.dart';
import 'features/ui/tabs/home_tab/CategoryHomeScreen/categoriesScreenDetails.dart';
import 'features/ui/tabs/home_tab/home_tab.dart';
import 'features/ui/wishList/WishListScreen.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        DeleteScreen.routeName:(context)=>DeleteScreen(),
        AddScreen.routeName:(context)=>AddScreen(),
        AdminScreen.routeName: (context) => AdminScreen(),
        TabletQrcodeScreen.routeName: (context) => TabletQrcodeScreen(),
        TabletScreen.routeName: (context) => TabletScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeTab.routeName: (context) => HomeTab(),
        HomeScreen.routeName: (context) => HomeScreen(),
        // ProductDetailsScreen.routeName: (context) => ProductDetailsScreen(),
        WishListScreen.routeName: (context) => WishListScreen(),
        // CategoriesScreenDetails.routeName: (context) =>
        //     CategoriesScreenDetails(),
      },
    );
  }
}
