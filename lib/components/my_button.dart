import 'package:flutter/material.dart';

class MyButton extends StatelessWidget
{
  const MyButton({
    Key? key,
    required this.onClick,
    required this.label,
    this.textColor = Colors.white,
    this.width,
    this.icon,
    this.outlineColor = Colors.grey,
    this.isOutline = false,
    this.isNoShadow = false
  }) : super(key: key);

  final VoidCallback onClick;
  final double? width;
  final IconData? icon;
  final Color textColor;
  final Color outlineColor;
  final bool isOutline;
  final bool isNoShadow;
  final String label;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: textColor,
            shadowColor: isNoShadow ? Colors.transparent : null,
            side: isOutline ?
            BorderSide(
                width: 2.0,
                color: outlineColor
            ) : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )
        ),
        onPressed: onClick,
        child: Row(
          children: [
            if(icon!=null)
              Icon(
                  icon,
                  color: textColor
              ),
            if(icon!=null)
              const SizedBox(width: 5),
            Text(label),
          ],
        ),
      ),
    );
  }
}