import 'package:flutter/material.dart';
import 'package:oddo_fe/core/constants/app_colors.dart';

class OdooCard extends StatelessWidget {
  String? title;
  String? subtitle;
  String? deadline;
  String? time;
  void Function()? onPressed;
  Widget? icon;

  OdooCard({super.key,
    this.title,
    this.subtitle,
    this.deadline,
    this.time,
    this.onPressed,
    this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: AppColors.cardColor,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     const Icon(
                        Icons.star_border,
                        color: Colors.white,
                      ),
                     const SizedBox(width: 8),
                      Text(
                        title ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     const Icon(
                        Icons.work_outline,
                        color: Colors.white70,
                        size: 16,
                      ),
                     const SizedBox(width: 4),
                      Text(
                        subtitle ?? "",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height:18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.white70,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        deadline ?? "",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Spacer(),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    time ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // const SizedBox(width: 8),
                  IconButton(onPressed: onPressed, icon: icon ?? const Icon(Icons.pause))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
