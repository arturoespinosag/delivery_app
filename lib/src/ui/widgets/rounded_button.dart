import 'package:deliveryapp/src/utils/colors.dart';
import 'package:deliveryapp/src/utils/font_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color textColor, buttonColor, borderColor;
  final EdgeInsets padding;

  const RoundedButton({
    Key key,
    @required this.label,
    @required this.onPressed,
    this.textColor = Colors.white,
    this.buttonColor = primaryColor,
    this.borderColor = primaryColor,
    this.padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Container(
        padding: this.padding,
        decoration: BoxDecoration(
          color: this.buttonColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            width: 1.4,
            color: this.borderColor,
          ),
        ),
        child: Text(
          this.label,
          style: FontStyles.normal.copyWith(
            fontWeight: FontWeight.w600,
            color: this.textColor,
          ),
        ),
      ),
      onPressed: this.onPressed,
      minSize: 30,
      padding: EdgeInsets.zero,
    );
  }
}
