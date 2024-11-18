import 'package:flutter/material.dart';
import '../../../config/theme/app_theme/theme.dart';
import '../app_colors.dart';
import '../app_dimen.dart';

Widget customTabBar(BuildContext context, {Widget? favouriteTab, Widget? oddoTab, Widget? localTab}) {
  return DefaultTabController(
    length: AppDimen.VALUE_3,
    child: Column(
      children: <Widget>[
        const TabBar(
            indicator:  const UnderlineTabIndicator(
                borderSide: BorderSide(
                    width: AppDimen.SIZE_3, color: AppColors.primaryColor),
                insets: EdgeInsets.symmetric(horizontal: AppDimen.PADDING_16)),
            labelStyle: AppThemes.nameTextStyle16,
            tabs: [
              Tab(text: "Favourites"),
              Tab(text: "Odoo"),
              Tab(text: "Local"),
            ]),
        const Divider(
          color: Colors.white24,
          thickness: AppDimen.SIZE_1,
          height: AppDimen.SIZE_1,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(children: [
            favouriteTab ?? Container(),
            oddoTab ?? Container(),
            localTab ?? Container(),
          ]),
        ),
      ],
    ),
  );
}