import 'package:flutter/material.dart';
import 'package:graduation_project/ui/tabs/allProducts_tab/getAllProducts.dart';

import 'package:graduation_project/ui/tabs/favourite_tab/fav_screen_tab.dart';
import 'package:graduation_project/ui/tabs/home_tab/home_tab.dart';
import 'package:graduation_project/ui/tabs/profile_tab/profile_tab.dart';
import 'package:graduation_project/ui/wishList/wishlist_icon.dart';
import 'package:graduation_project/utils/app_colors.dart';

import '../utils/app_styles.dart';
import '../widgets/searchTextfiled.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), GetAllproducts(), FavTab(), ProfileTab()];


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: selectedIndex < 3
          ? AppBar(
              toolbarHeight: height * 0.14,
              title: Column(
                children: [
                  Text("Pick & Pay", style: AppStyles.extraBold24Blue),
                  Row(
                    children: [
                      Expanded(
                        child: Searchtextfiled(hint: "what do you search for?"),
                      ),
                      SizedBox(width: width * 0.03),
                      WishlistIcon(),
                    ],
                  ),
                ],
              ),
              centerTitle: true,
            )
          : null,
      bottomNavigationBar: customBottomNav(),
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
          : ImageIcon(AssetImage(imagePath), size: 24, color: AppColors.white),
      label: "",
    );
  }

  Widget customBottomNav() {
    return Container(
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
          bottomNavigationItem(
            imagePath: "assets/images/home_icon.png",
            isSelected: selectedIndex == 0,
          ),
          bottomNavigationItem(
            imagePath: "assets/images/category_icon.png",
            isSelected: selectedIndex == 1,
          ),
          bottomNavigationItem(
            imagePath: "assets/images/fav_icon.png",
            isSelected: selectedIndex == 2,
          ),
          bottomNavigationItem(
            imagePath: "assets/images/profile_icon.png",
            isSelected: selectedIndex == 3,
          ),
        ],
      ),
    );
  }
}
