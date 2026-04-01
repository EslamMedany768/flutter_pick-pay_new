import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_project/Core/utils/app_colors.dart';

class FlutterToast {
  static showToast({required String text}) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.blue,
      textColor: AppColors.white,
      fontSize: 24.0,
    );
  }
}
