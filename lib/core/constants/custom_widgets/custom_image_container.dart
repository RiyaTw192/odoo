import 'package:flutter/cupertino.dart';
import '../app_colors.dart';
import '../app_dimen.dart';
import '../app_strings.dart';

class CustomImageContainer extends StatelessWidget {
  String? image;
  String? text;
  String? subText;
  CustomImageContainer({
    super.key,
    this.image,
    this.text,
    this.subText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppDimen.SIZE_192,
          height: AppDimen.SIZE_192,
          decoration: BoxDecoration(
            color: AppColors.imageBgColor,
            borderRadius: AppDimen.BORDER_20,
          ),
          child: Image.asset(
            image ?? "",
            width: AppDimen.SIZE_100,
            height: AppDimen.SIZE_100,
          ),
        ),
        SizedBox(height: AppDimen.SIZE_32,),
        Text(
          text??"",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: AppTextSize.HEADING_LARGE_32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppDimen.SIZE_10),
        Text(
          subText??"",
          style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: AppTextSize.BODY_LARGE_16,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
