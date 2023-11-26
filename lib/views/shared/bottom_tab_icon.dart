import 'package:flutter/material.dart';

class BottomTabIcon extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final Color? color;

  const BottomTabIcon({
    super.key,
    this.onTap,
    this.icon,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        width: 36,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
