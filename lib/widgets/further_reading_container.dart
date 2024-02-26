import 'package:scids/constants/colors.dart';
import 'package:scids/widgets/edu_custom_image.dart';
import 'package:flutter/material.dart';

class FurtherReadingContainer extends StatelessWidget {
  const FurtherReadingContainer({
    Key? key,
    required this.data,
    this.onTap,
  }) : super(key: key);

  final data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.all(10),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            CustomImagePlaceholder(
              data["image"],
              radius: 15,
              height: 80,
            ),
            const SizedBox(
              width: 10,
            ),
            _buildInfo()
          ],
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data["course"],
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          data["location"],
          style: const TextStyle(fontSize: 14, color: textColor),
        ),
        const SizedBox(
          height: 15,
        ),
        _buildDurationAndRate()
      ],
    );
  }

  Widget _buildDurationAndRate() {
    return Row(
      children: [
        const Icon(
          Icons.schedule_rounded,
          color: labelColor,
          size: 14,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          data["duration"],
          style: const TextStyle(
            fontSize: 12,
            color: labelColor,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        const Icon(
          Icons.star,
          color: Colors.orange,
          size: 14,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          data["review"],
          style: const TextStyle(
            fontSize: 12,
            color: labelColor,
          ),
        )
      ],
    );
  }
}
