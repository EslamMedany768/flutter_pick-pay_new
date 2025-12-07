import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/ui/tabs/favourite_tab/rectangle_cardWidget.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

import '../../../model/FavouraiteItemModel.dart';


class FavTab extends StatefulWidget {
  const FavTab({super.key});

  @override
  State<FavTab> createState() => _FavTabState();
}

class _FavTabState extends State<FavTab> {
  late Future<FavouraitesDTO?> favouritesFuture;

  @override
  void initState() {
    super.initState();
    favouritesFuture = ApiManager.getFavouritesById("1234");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FavouraitesDTO?>(
      future: favouritesFuture,
      builder: (context, snapshot) {
        // LOADING
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.blue),
          );
        }

        // ERROR
        if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Connection error", style: AppStyles.medium20blue),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    favouritesFuture = ApiManager.getFavouritesById("1234");
                  });
                },
                child: Text("Please try again", style: AppStyles.medium20blue),
              ),
            ],
          );
        }

        // NULL DATA
        if (!snapshot.hasData || snapshot.data == null) {
          return Center(child: Text("No favourites found"));
        }

        final data = snapshot.data!;

        // API STATUS NOT OK
        if (data.status != "Ok") {
          return Center(child: Text("Error fetching favourites"));
        }

        // EMPTY LIST
        if (data.items.isEmpty) {
          return Center(child: Text("No favourites found"));
        }

        // SHOW LIST
        return ListView.builder(
          itemCount: data.items.length,
          itemBuilder: (context, index) {
            final item = data.items[index];
            return RectangleCardWidget(item: item);
          },
        );
      },
    );
  }
}
