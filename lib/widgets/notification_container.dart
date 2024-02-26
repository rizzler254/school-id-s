import 'package:scids/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as Badge;

Widget buildIconNotificationContainer() {
  return Badge.Badge(
    badgeStyle: const Badge.BadgeStyle(
      elevation: 0,
      padding: EdgeInsets.all(3),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      badgeColor: notificationColor,
    ),
    position: Badge.BadgePosition.topEnd(top: -7, end: 2),
    badgeContent: const Text(
      '',
      style: TextStyle(color: Colors.white),
    ),
    child: Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: tertiaryColor,
        border: Border.all(
          color: Colors.grey.withOpacity(.3),
        ),
      ),
      child: Icon(
        Icons.notifications,
        color: blackColor.withOpacity(.7),
        size: 20,
      ),
    ),
  );
}
