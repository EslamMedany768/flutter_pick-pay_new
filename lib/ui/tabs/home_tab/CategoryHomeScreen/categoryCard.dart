import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:graduation_project/model/CategoriesModel.dart';

import '../../../../utils/app_styles.dart';
import 'categories_details.dart';
import 'getProductById.dart';

class Categorycard extends StatefulWidget {
  bool second;
  List<Category?> categroyList;

  Categorycard({super.key, required this.categroyList, this.second = true});

  @override
  State<Categorycard> createState() => _CategorycardState();
}

class _CategorycardState extends State<Categorycard> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.categroyList.length - 4,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            widget.second
                ? Navigator.pushNamed(
                    context,
                    CategoriesDetails.routeName,
                    arguments: widget.categroyList[index + 4],
                  )
                : Navigator.pushNamed(
                    context,
                    CategoriesDetails.routeName,
                    arguments: widget.categroyList[index],
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
                      ? widget.categroyList[index + 4]!.logoUrl ?? ""
                      : widget.categroyList[index]!.logoUrl ?? "",
                ),
              ),
              Container(
                width: width * 0.3,
                height: height * 0.05,

                child: Text(
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  widget.second == true
                      ? widget.categroyList[index + 4]!.name ?? ""
                      : widget.categroyList[index]!.name ?? "",
                  style: AppStyles.light14blue,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
