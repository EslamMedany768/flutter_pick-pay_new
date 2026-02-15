import 'package:flutter/material.dart';
import 'package:graduation_project/api/api_manager.dart';
import 'package:graduation_project/ui/tabs/favourite_tab/fav_card_widget.dart';
import 'package:graduation_project/utils/app_colors.dart';
import 'package:graduation_project/utils/app_styles.dart';

import '../../../data/model/FavouraiteItemModel.dart';


class FavTab extends StatefulWidget {
  const FavTab({super.key});

  @override
  State<FavTab> createState() => _FavTabState();
}

class _FavTabState extends State<FavTab> {
  late Future<FavouraitesDTO?> favouritesFuture;
  ApiManager apiManager = ApiManager();

  @override
  void initState() {
    super.initState();
    favouritesFuture = apiManager.getFavourites();
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
          print(snapshot.error);
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
          Center(child: Text("no items",
              style: AppStyles.medium20blue)),
        SizedBox(height: 10),
        // ElevatedButton(
        //
        // onPressed: () {
        // setState(() {
        // favouritesFuture = apiManager.getFavourites();
        // });
        // },
        // child: Text("Please try again", style: AppStyles.medium20blue),
        // ),
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
        return FavCardWidget(item: item);
        },
        )
        ;
      },
    );
  }
}
