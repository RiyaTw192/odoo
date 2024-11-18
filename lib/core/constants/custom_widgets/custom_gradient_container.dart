import 'package:flutter/cupertino.dart';

import '../app_colors.dart';

class GradientContainer extends StatelessWidget {
  Widget? child;
  GradientContainer({
    super.key,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.gradient1, AppColors.gradient2],
        ),
      ),
      child: child,
    );
  }
}
