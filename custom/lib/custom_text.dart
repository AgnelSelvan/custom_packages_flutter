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
