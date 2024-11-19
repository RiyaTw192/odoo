import 'package:flutter/material.dart';
import 'package:oddo_fe/core/constants/app_colors.dart';
class OdooScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TaskCard(
              title: "iOS app deployment",
              subtitle: "SO056 - Booqio V2",
              deadline: "Deadline 07/20/2023",
              time: "00:30",
            ),
            TaskCard(
              title: "iOS app deployment with odd",
              subtitle: "SO056 - Booqio V2",
              deadline: "Deadline 07/20/2023",
              time: "00:30",
            ),
            TaskCard(
              title: "iOS app deployment with odd",
              subtitle: "SO056 - Booqio V2",
              deadline: "Deadline 07/20/2023",
              time: "00:30",
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String deadline;
  final String time;

  TaskCard({
    required this.title,
    required this.subtitle,
    required this.deadline,
    required this.time,
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
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    VerticalDivider(
                      width: 20,
                      thickness: 1,
                      indent: 20,
                      endIndent: 0,
                      color: AppColors.yellowColor,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.work_outline,
                      color: Colors.white70,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.white70,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      deadline,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.pause, color: Colors.black),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
