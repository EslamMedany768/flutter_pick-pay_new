import 'package:flutter/material.dart';
import 'package:graduation_project/ui/tabs/category_tab/category_screen_tab.dart';
import 'package:graduation_project/ui/tabs/favourite_tab/fav_tab.dart';
import 'package:graduation_project/ui/tabs/home_tab/home_tab.dart';
import 'package:graduation_project/ui/tabs/profile_tab/profile_tab.dart';
import 'package:graduation_project/utils/app_colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs=[
    HomeTab(),
    CategoryTab(),
    FavTab(),
    ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontSize: 0),
          selectedItemColor: AppColors.blue,
          backgroundColor: AppColors.blue,
          items: [
            bottomNavigationItem(imagePath: "assets/images/home_icon.png",
                isSelected: selectedIndex==0),
            bottomNavigationItem(imagePath: "assets/images/category_icon.png",
                isSelected: selectedIndex==1),
            bottomNavigationItem(imagePath: "assets/images/fav_icon.png",
                isSelected: selectedIndex==2),
            bottomNavigationItem(imagePath: "assets/images/profile_icon.png",
                isSelected: selectedIndex==3),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem bottomNavigationItem({
    required String imagePath,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: isSelected
          ? Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.white,
              ),
              child: ImageIcon(AssetImage(imagePath), size: 24),
            )
          : ImageIcon(AssetImage(imagePath), size: 24,color: AppColors.white,),
      label: "",
    );
  }
}
