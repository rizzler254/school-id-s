import 'package:scids/constants/colors.dart';
import 'package:scids/widgets/edu_custom_image.dart';
import 'package:flutter/material.dart';

class SemesterCoursesContainer extends StatelessWidget {
  const SemesterCoursesContainer({
    Key? key,
    required this.data,
    this.width = 280,
    this.height = 290,
    this.onTap,
  }) : super(key: key);

  final data;
  final double width;
  final double height;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Stack(
          children: [
            CustomImagePlaceholder(
              data["image"],
              width: double.infinity,
              height: 190,
              radius: 15,
            ),
            Positioned(
              top: 170,
              right: 15,
              child: _buildCustomBadge(),
            ),
            Positioned(
              top: 210,
              child: _buildInfo(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      width: width - 20,
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data["name"],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 17,
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          _buildBottomSection(),
        ],
      ),
    );
  }

  Widget _buildCustomBadge() {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.05),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: const Icon(
        Icons.play_circle_outline,
        color: Colors.white,
        size: 30,
      ),
    );
  }

  Widget _buildBottomSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _getAttribute(
          Icons.play_circle_outlined,
          labelColor,
          data["session"],
        ),
        const Spacer(),
        _getAttribute(
          Icons.schedule_rounded,
          labelColor,
          data["duration"],
        ),
      ],
    );
  }

  _getAttribute(IconData icon, Color color, String info) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: labelColor, fontSize: 13),
        ),
      ],
    );
  }
}
