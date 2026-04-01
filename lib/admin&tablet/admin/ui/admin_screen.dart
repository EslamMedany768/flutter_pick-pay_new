import 'package:flutter/material.dart';
import 'package:graduation_project/admin&tablet/admin/ui/delete_screen/delete_screen.dart';
import 'package:graduation_project/admin&tablet/admin/ui/widget/card_widget.dart';

import 'add_screen/add_screen.dart';

class AdminScreen extends StatefulWidget {
  static const String routeName = "Admin_Screen";

  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: height * 0.2),
          CardWidget(text: "Add", onButtonClicked: onAddButtonClicked),
          CardWidget(text: "Update", onButtonClicked: onUpdateButtonClicked),
          CardWidget(text: "Delete", onButtonClicked: onDeleteButtonClicked),
          SizedBox(height: height * 0.2),
        ],
      ),
    );
  }

  void onAddButtonClicked() {
    Navigator.of(context).pushNamed(AddScreen.routeName);
  }

  void onUpdateButtonClicked() {}

  void onDeleteButtonClicked() {
    Navigator.of(context).pushNamed(DeleteScreen.routeName);
  }
}
