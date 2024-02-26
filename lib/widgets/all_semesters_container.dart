import 'package:scids/constants/colors.dart';
import 'package:flutter/material.dart';

class AllSemestersContainer extends StatelessWidget {
  const AllSemestersContainer({
    Key? key,
    required this.data,
    this.isSelected = false,
    this.onTap,
    this.selectedColor = notificationColor,
  }) : super(key: key);

  final data;
  final Color selectedColor;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(1, 1),
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: tertiaryColor.withOpacity(0.5),
              radius: 15,
              child: Text(
                data["text"],
                style: const TextStyle(
                  color: tertiaryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            data["name"],
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
