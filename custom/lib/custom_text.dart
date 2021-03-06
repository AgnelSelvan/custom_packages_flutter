import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final FontWeight? fontWeight;
  final Color? color;
  final String text;
  final double? size, letterSpacing;

  const CustomText(this.text,
      {Key? key, this.fontWeight, this.color, this.size, this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
    );
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size ?? 12,
          fontWeight: fontWeight,
          letterSpacing: letterSpacing),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final double? size;
  const CustomIcon(
    this.icon, {
    Key? key,
    this.color,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
    );
    return Icon(
      icon,
      color: color,
      semanticLabel: "Add",
      size: size ?? 16,
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final Color? backgoundColor;
  final Color? textColor;
  final double? fontSize;
  final String label;

  final VoidCallback? onPressed;
  const CustomTextButton(this.label,
      {Key? key,
      this.backgoundColor,
      this.fontSize,
      this.onPressed,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
    );
    return TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 10, horizontal: 6)),
            backgroundColor: MaterialStateProperty.all(backgoundColor)),
        onPressed: onPressed,
        child: Text(label,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            )));
  }
}

class CustomTextButtonIcon extends StatelessWidget {
  final IconData icon;
  final Color? backgoundColor;
  final Color? textColor;
  final double? fontSize;
  final String label;

  final VoidCallback? onPressed;
  const CustomTextButtonIcon(
    this.icon,
    this.label, {
    Key? key,
    this.backgoundColor,
    this.textColor,
    this.fontSize,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 15, horizontal: 25)),
            backgroundColor: MaterialStateProperty.all(backgoundColor)),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: textColor,
        ),
        label: Text(label,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            )));
  }
}
