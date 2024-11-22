import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oddo_fe/core/constants/app_dimen.dart';

import '../../../config/theme/app_theme/theme_bloc.dart';
import '../../../config/theme/app_theme/theme_state.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/custom_widgets/custom_appbar.dart';
import '../../project/bloc/create_project_bloc.dart';
import '../../project/bloc/create_project_event.dart';
import '../../project/bloc/create_project_state.dart';
import '../../timesheet/bloc/dropdown_bloc.dart';

class CreateProjects extends StatefulWidget {
  const CreateProjects({super.key});

  @override
  State<CreateProjects> createState() => _CreateProjectsState();
}

class _CreateProjectsState extends State<CreateProjects> {
  final List<Map<String, dynamic>> colors = [
    {'name': 'White (default)', 'color': AppColors.whiteColor},
    {'name': 'Green', 'color': Colors.green},
    {'name': 'Red', 'color': Colors.red},
    {'name': 'Yellow', 'color': Colors.yellow},
    {'name': 'Orange', 'color': Colors.orange},
    {'name': 'Light Blue', 'color': Colors.lightBlue},
    {'name': 'Medium blue', 'color': Colors.blue},
    {'name': 'Dark blue', 'color': Colors.indigo},
    {'name': 'Purple', 'color': Colors.purple},
    {'name': 'Dark purple', 'color': Colors.deepPurple},
    {'name': 'Fushia', 'color': Colors.pink},
    {'name': 'Salmon pink', 'color': Colors.deepOrange},
  ];

  Map<String, dynamic>? selectedColor;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DropdownBloc(),
          ),
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider(
            create: (context) => CreateProjectBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, themeState) {
              return BlocBuilder<CreateProjectBloc, CreateProjectState>(
                  builder: (context, state) {
                    final bloc = context.read<CreateProjectBloc>();
                    return Scaffold(
                      body: Container(
                        decoration: themeState.backgroundDecoration,
                        child: SafeArea(
                          child: Padding(
                            padding: const EdgeInsets.all(AppDimen.PADDING_16),
                            child: Column(
                              children: [
                                CustomAppBar(
                                  title: AppStrings.createProjects,
                                  leadingIcon: Icons.arrow_back_ios_new,
                                ),
                                const SizedBox(height: AppDimen.SIZE_16,),
                                TextField(
                                  onChanged: (value) {},
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontSize: AppTextSize.BODY_LARGE_16,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: AppStrings.name,
                                    labelStyle: TextStyle(
                                        fontSize: AppTextSize.BODY_LARGE_16,
                                        color: AppColors.whiteColor),
                                    fillColor: Colors.transparent,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          AppDimen.RADIUS_A9),
                                      borderSide: BorderSide(
                                          color: AppColors.borderColor,
                                          width: AppDimen.SIZE_1),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          AppDimen.RADIUS_A9),
                                      borderSide: BorderSide(
                                          color: AppColors.borderColor,
                                          width: AppDimen.SIZE_1),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: AppDimen.SIZE_16),
                                DropdownButtonFormField<Map<String, dynamic>>(
                                  value: state.selectedColor,
                                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                                  iconEnabledColor: AppColors.whiteColor,
                                  decoration: InputDecoration(
                                    labelText: AppStrings.color,
                                    fillColor: Colors.transparent,
                                    labelStyle: TextStyle(
                                      fontSize: AppTextSize.BODY_LARGE_16,
                                      color: AppColors.whiteColor,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(AppDimen.SIZE_8),
                                      borderSide: BorderSide(color: AppColors.borderColor),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(AppDimen.SIZE_8),
                                      borderSide: BorderSide(color: AppColors.borderColor, width: AppDimen.SIZE_2),
                                    ),
                                  ),
                                  items: colors.map((color) {
                                    return DropdownMenuItem<Map<String, dynamic>>(
                                      value: color,
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: color['color'],
                                            radius: AppDimen.SIZE_10,
                                          ),
                                          SizedBox(width: AppDimen.SIZE_8),
                                          Text(
                                            color['name'],
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    bloc.add(SelectColorEvent(value!));
                                  },
                                  selectedItemBuilder: (BuildContext context) {
                                    return colors.map<Widget>((color) {
                                      if (color == state.selectedColor) {
                                        return Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: color['color'],
                                              radius: AppDimen.SIZE_10,
                                            ),
                                            SizedBox(width: AppDimen.SIZE_8),
                                            Text(
                                              color['name'],
                                              style: TextStyle(
                                                color: AppColors.whiteColor,
                                                fontSize: AppTextSize.BODY_LARGE_16,
                                              ),
                                            ),
                                          ],
                                        );
                                      }
                                      return SizedBox.shrink();
                                    }).toList();
                                  },
                                ),
                                SizedBox(height: AppDimen.SIZE_16),
                                Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.white,
                                      side: BorderSide(
                                        color: AppColors.whiteColor,
                                        width: AppDimen.SIZE_2,
                                      ),
                                      value: state.isFavorite,
                                      onChanged: (value) {
                                        bloc.add(ToggleFavoriteEvent(value!));
                                      },
                                    ),
                                    Text(AppStrings.makeFavorite,style: TextStyle(fontSize: AppDimen.SIZE_16,color: AppColors.whiteColor),)
                                  ],
                                ),
                                Spacer(),
                                Container(
                                  height: AppDimen.SIZE_50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(AppDimen.RADIUS_A12),
                                    color: AppColors.syncBoxBgColor,
                                  ),
                                  child: Center(
                                    child: Text(AppStrings.createProjects,style: TextStyle(color: AppColors.whiteColor,fontSize: AppTextSize.BODY_LARGE_14,fontWeight: FontWeight.w500),),
                                  ),
                                  
                                )
                              ],
                            ),
                          ),
                        ),

                      ),
                    );
                  }
              );
            }
        )
    );
  }
  }

