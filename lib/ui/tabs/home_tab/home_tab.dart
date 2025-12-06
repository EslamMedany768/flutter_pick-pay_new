import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

import '../../../widgets/searchTextfiled.dart';
import '../../../widgets/wishlist_icon.dart';
import 'EveryDayNeedsProduct/getEveryDayProduct.dart';
import 'EveryDayNeedsProduct/productCardwidget.dart';
import 'CategoryHomeScreen/getCategory.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = "homeScreenTab";

  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> offersList = [
    "assets/images/offers_image (1).png",
    "assets/images/offers_image (1).png",
    "assets/images/offers_image (1).png",
  ];
  List<String> categoryList = [
    'assets/images/category01.png',
    'assets/images/category02.png',
    'assets/images/category03.png',
    'assets/images/category04.png',
    'assets/images/category04.png',
    'assets/images/category04.png',
    'assets/images/category04.png',
    'assets/images/category04.png',
    'assets/images/category04.png',
    'assets/images/category04.png',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.04,
        title: Text("Pick & Pay", style: AppStyles.extraBold24Blue),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),

        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Searchtextfiled(hint: "what do you search for?"),
                ),
                SizedBox(width: width * 0.03),
                WishlistIcon(),
              ],
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CarouselSlider.builder(
                  itemCount: offersList.length,
                  itemBuilder: (context, index, realIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      child: Image.asset(offersList[index]),
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      selectedIndex = index;
                      setState(() {});
                    },

                    height: height * 0.23,
                    viewportFraction: width * 0.0026,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    initialPage: selectedIndex,
                  ),
                ),
                createIndicator(),
              ],
            ),
            SizedBox(height: height * 0.015),
            Text("Categories", style: AppStyles.medium18blueDark),
            SizedBox(
              height: height * 0.200,
              child: CategoryWidget(second: false),
            ),
            SizedBox(
              height: height * 0.19,
              child: CategoryWidget(second: true),
            ),
            Text("Everyday Needs", style: AppStyles.medium18blueDark),
            SizedBox(height: height * 0.02),
            SizedBox(
              height: height * 0.33,
              width: 0.4,
              child: getProductcardwidget(),
            ),
          ],
        ),
      ),
    );
  }

  createIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < offersList.length; i++)
          Container(
            margin: EdgeInsets.all(5),
            height: selectedIndex == i ? 7 : 5,
            width: selectedIndex == i ? 7 : 5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectedIndex == i ? AppColors.blue : Colors.white,
            ),
          ),
      ],
    );
  }
}
