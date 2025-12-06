import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/model/CategoriesModel.dart';
import 'package:graduation_project/ui/tabs/home_tab/CategoryHomeScreen/categoryCard.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

class CategoryWidget extends StatefulWidget {
  bool second;

  CategoryWidget({super.key, this.second = false});

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

        if (snapshot.data!.status != "ok") {
          return Center(
            child: Text("Error from API", style: AppStyles.medium20blue),
          );
        }

        List<Category?> categoriesList = snapshot.data!.categories!;

        return Categorycard(
          categroyList: categoriesList,
          second: widget.second,
        );
      },
    );
  }
}
