import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomUtilies {
  static void navigateReplacement(BuildContext context, String routes,
      {List? arguments}) {
    Navigator.pushReplacementNamed(context, routes, arguments: arguments);
  }

  static void navigate(BuildContext context, String routes, {Map? arguments}) {
    Navigator.pushNamed(context, routes, arguments: arguments);
  }

  static void customSnackBar(String text, Color backgroundColor,
      Color textColor, String content, Icon icon,
      {int? seconds}) {
    Get.snackbar(text, content,
        icon: icon,
        backgroundColor: backgroundColor,
        colorText: textColor,
        duration: Duration(seconds: seconds ?? 2));
  }

  static void customSuccessSnackBar(String text, String content,
      {int? seconds}) {
    Get.snackbar(text, content,
        icon: Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
        backgroundColor: Colors.green[400],
        colorText: Colors.white,
        duration: Duration(seconds: seconds ?? 2));
  }

  static void customFailureSnackBar(String text, String content,
      {int? seconds}) {
    Get.snackbar(text, content,
        icon: Icon(
          Icons.cancel,
          color: Colors.white,
        ),
        backgroundColor: Colors.red[400],
        colorText: Colors.white,
        duration: Duration(seconds: seconds ?? 2));
  }

  static Future<bool> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
      return true;
    } else {
      // throw 'Could not launch $url';
      return false;
    }
  }

  static void actionSnackBar(
      int seconds,
      String text,
      Color color,
      GlobalKey<ScaffoldState> scaffoldKey,
      Function actionFtn,
      String actionText) {
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        elevation: 6,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: color,
        duration: Duration(seconds: seconds),
        content: CustomText(
          text,
          color: Colors.white,
        ),
        action: SnackBarAction(
          textColor: const Color(0xFFFAF2FB),
          label: actionText,
          onPressed: () {
            actionFtn();
          },
        ),
      ),
    );
  }
}

class CustomScreenUtility {
  final BuildContext context;
  CustomScreenUtility(this.context) : assert(context != null);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
}
