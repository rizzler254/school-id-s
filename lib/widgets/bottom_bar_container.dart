import 'package:scids/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class BottomBarContainer extends StatelessWidget {
  const BottomBarContainer(
    this.icon, {
    super.key,
    this.onTap,
    this.color = Colors.grey,
    this.activeColor = primaryColor,
    this.isActive = false,
    this.isNotified = false,
  });

  final String icon;
  final Color color;
  final Color activeColor;
  final bool isNotified;
  final bool isActive;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: Colors.black87.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 0), // changes position of shadow
              ),
          ],
        ),
        child: SvgPicture.asset(
          icon,
          color: isActive ? activeColor : color,
          width: 23,
          height: 23,
        ),
      ),
    );
  }
}
