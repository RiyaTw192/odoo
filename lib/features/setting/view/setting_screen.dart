import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/theme/app_theme/theme_bloc.dart';
import '../../../config/theme/app_theme/theme_state.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimen.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/custom_widgets/custom_appbar.dart';
import '../../../core/constants/custom_widgets/custom_image_container.dart';
import '../../../core/constants/custom_widgets/custom_tabBar_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final List<Map<String, String>> odooAccounts = [
    {'url': 'https://portal.apexive.com/', 'email': 'Nikita3@apexive.com'},
    {'url': 'https://portal.apexive.com/', 'email': 'Nikita3@apexive.com'},
  ];

  final List<Map<String, String>> githubAccounts = [
    {'email': 'Nikita3@apexive.com'},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return Scaffold(
            body: Container(
             // decoration: themeState.backgroundDecoration,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppDimen.PADDING_12,horizontal: AppDimen.PADDING_16),
                    child: CustomAppBar(
                      title: AppStrings.settings,
                    ),
                  ),
                  _buildThemeSection(),
                  const Divider(color: Colors.white24, thickness: 1.0),

                  _buildSectionTitle(AppStrings.synchronizations),
                  _buildAccountSection(AppStrings.odoo, odooAccounts, AppStrings.syncNewOdooAccount),
                  _buildAccountSection(AppStrings.github, githubAccounts, AppStrings.syncNewGitHubAccount),
                  const Divider(color: Colors.white24, thickness: 1.0),
                  _buildFooterOption(AppStrings.privacyPolicy),
                  _buildFooterOption(AppStrings.termsOfService),
                ],
              ),
            ),
          );

        }
    );
  }
  Widget _buildThemeSection() {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        bool isLightTheme = themeState.themeData.brightness == Brightness.light;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimen.PADDING_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppStrings.theme,
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: AppDimen.PADDING_8),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: isLightTheme ?AppColors.boxBgColor : AppColors.darkBoxBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      isLightTheme ? AppStrings.lightTheme : AppStrings.darkTheme,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        //context.read<ThemeBloc>().add(ThemeEvent.toggle);
                      },
                      child: Icon(
                        isLightTheme ? Icons.brightness_7 : Icons.brightness_2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: AppDimen.PADDING_16, bottom: AppDimen.PADDING_8,left: AppDimen.PADDING_16),
      child: Text(
        title,
        style: TextStyle(color: Colors.white70, fontSize: 16),
      ),
    );
  }

  Widget _buildAccountSection(String title, List<Map<String, String>> accounts, String syncButtonText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimen.PADDING_16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle(title),
          ...accounts.map((account) => _buildAccountTile(account)).toList(),
          SizedBox(height: 8.0),
          _buildSyncButton(syncButtonText),
        ],
      ),
    );
  }

  Widget _buildAccountTile(Map<String, String> account) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          bool isLightTheme = themeState.themeData.brightness ==
              Brightness.light;
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: isLightTheme?AppColors.darkBlue: AppColors.darkBoxBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (account.containsKey('url'))
                  Text(
                    account['url']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                Text(
                  account['email']!,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          );
        }
    );
  }

  Widget _buildSyncButton(String text) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          bool isLightTheme = themeState.themeData.brightness ==
              Brightness.light;
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color:isLightTheme? AppColors.syncBoxBgColor:AppColors.darkSyncBoxBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        }
    );
  }

  Widget _buildFooterOption(String text) {
    return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          bool isLightTheme = themeState.themeData.brightness == Brightness.light;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimen.PADDING_16),
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:isLightTheme?AppColors.settingBoxColor:AppColors.darkBoxBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          );

        }
    );
  }
}