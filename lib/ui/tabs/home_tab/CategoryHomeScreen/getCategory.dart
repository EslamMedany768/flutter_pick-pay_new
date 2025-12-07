 /// ديه اول حاجه بتتنادي عششان تظهر ال categories
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/model/CategoriesModel.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

import 'categoriesScreenDetails.dart';

class CategoryWidget extends StatefulWidget {
  bool second;

  CategoryWidget({super.key, required this.second});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late Future<CategoriesModel?> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = ApiManager.getCategories(); // call واحدة فقط
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return FutureBuilder<CategoriesModel?>(
      future: _categoriesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.blue),
          );
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Connection error", style: AppStyles.medium20blue),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _categoriesFuture =
                        ApiManager.getCategories(); // إعادة المحاولة
                  });
                },
                child: Text("Please try again", style: AppStyles.medium20blue),
              ),
            ],
          );
        }

        if (snapshot.data!.status != "Ok") {
          return Center(
            child: Text("Error from API", style: AppStyles.medium20blue),
          );
        }

        List<Category?> categoriesList = snapshot.data!.categories!;

        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length - 4,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                widget.second
                    ? Navigator.pushNamed(
                        context,
                        CategoriesScreenDetails.routeName,
                        arguments: categoriesList[index + 4],
                      )
                    : Navigator.pushNamed(
                        context,
                        CategoriesScreenDetails.routeName,
                        arguments: categoriesList[index],
                      );
                setState(() {});
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: width * 0.35,
                    height: height * 0.13,
                    child: Image.network(
                      fit: BoxFit.fill,
                      widget.second == true
                          ? categoriesList[index + 4]!.logoUrl ?? ""
                          : categoriesList[index]!.logoUrl ?? "",
                    ),
                  ),
                  Container(
                    width: width * 0.3,
                    height: height * 0.05,

                    child: Text(
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.visible,
                      widget.second == true
                          ? categoriesList[index + 4]!.name ?? ""
                          : categoriesList[index]!.name ?? "",
                      style: AppStyles.light14blue,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
