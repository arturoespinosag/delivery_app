import 'package:deliveryapp/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final double size = 50;
  final Color backgroundColor;
  final Color iconColor = Colors.white;

  const CircleButton({
    Key key,
    @required this.onPressed,
    @required this.icon,
    this.backgroundColor = primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Container(
        width: this.size,
        height: this.size,
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: this.backgroundColor,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          this.icon,
          color: this.iconColor,
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
