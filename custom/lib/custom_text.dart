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
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: ScreenUtil().setSp(size ?? 12),
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
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
    );
    return Icon(
      icon,
      color: color,
      semanticLabel: "Add",
      size: ScreenUtil().setSp(size ?? 16),
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
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgoundColor)),
        onPressed: onPressed,
        child: CustomText(
          label,
          color: textColor,
          size: fontSize,
        ));
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
            backgroundColor: MaterialStateProperty.all(backgoundColor)),
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: CustomText(
          label,
          color: textColor,
          size: fontSize,
        ));
  }
}
