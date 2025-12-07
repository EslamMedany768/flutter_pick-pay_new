import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/auth/login_screen.dart';
import 'package:graduation_project/auth/register_screen.dart';
import 'package:graduation_project/ui/wishList/WishListScreen.dart';
import 'package:graduation_project/ui/home.dart';
import 'package:graduation_project/ui/tabs/widgets/ProductDetailsScreen(whenProductClicked).dart';
import 'package:graduation_project/ui/tabs/home_tab/CategoryHomeScreen/categoriesScreenDetails.dart';
import 'package:graduation_project/ui/tabs/home_tab/home_tab.dart';

void main() {
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
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        HomeTab.routeName:(context)=>HomeTab(),
        HomeScreen.routeName:(context)=>HomeScreen(),
        ProductDetailsScreen.routeName:(context)=>ProductDetailsScreen(),
        WishListScreen.routeName:(context)=>WishListScreen(),
        CategoriesScreenDetails.routeName:(context)=>CategoriesScreenDetails(),
      },
    );
  }
}
