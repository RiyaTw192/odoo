import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oddo_fe/core/constants/app_colors.dart';
import 'package:oddo_fe/core/constants/app_dimen.dart';
import 'package:oddo_fe/features/timesheet/bloc/dropdown_bloc.dart';
import 'package:oddo_fe/features/timesheet/bloc/dropdown_state.dart';

import '../../../../config/theme/app_theme/theme_bloc.dart';
import '../../../../config/theme/app_theme/theme_state.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/custom_widgets/custom_appbar.dart';
import '../../bloc/dropdown_event.dart';

class CreateTimerScreen extends StatefulWidget {
  @override
  _CreateTimerScreenState createState() => _CreateTimerScreenState();
}

class _CreateTimerScreenState extends State<CreateTimerScreen> {
  String? selectedProject;
  String? selectedTask;
  String description = '';
  bool isFavorite = false;

  final List<String> projects = ['Project A', 'Project B', 'Project C'];
  final List<String> tasks = ['Task 1', 'Task 2', 'Task 3'];

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
        ],
        child:
            BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
               bool isLightTheme = themeState.themeData.brightness == Brightness.light;
              return Scaffold(
                backgroundColor: isLightTheme ?AppColors.gradient2: AppColors.greyColor,
                bottomNavigationBar:  Padding(
                  padding: const EdgeInsets.all(AppDimen.PADDING_16),
                  child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     backgroundColor:  isLightTheme ?AppColors.syncBoxBgColor: AppColors.greyColor,
                     padding: const EdgeInsets.symmetric(vertical: AppDimen.SIZE_16),
                                ),
                                onPressed: () {
                                _createTimer();
                                },
                                child:  Text(
                                AppStrings.createTimer,
                                style: TextStyle(fontSize: AppDimen.SIZE_16,color: AppColors.whiteColor ),
                                ),
                  ),
                ),
               body: SingleChildScrollView(
              child: Container(
                decoration: themeState.backgroundDecoration,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimen.PADDING_16),
                    child: Column(
                      children: [
                        CustomAppBar(
                          title: AppStrings.createTimer,
                          leadingIcon: Icons.arrow_back_ios_new,
                        ),
                        const SizedBox(
                          height: AppDimen.SIZE_16,
                        ),
                        BlocBuilder<DropdownBloc, DropdownState>(
                            builder: (context, state) {
              String? selectedProject = (state is DropdownLoaded) ? state.selectedProject : null;
              String? selectedTask = (state is DropdownLoaded) ? state.selectedTask : null;
              String description = (state is DropdownLoaded) ? state.description : '';

                          return Column(
                            children:[
                              _buildDropdownField(
                              label: AppStrings.project,
                              value: selectedProject,
                              items: projects,
                              onChanged: (value) {
                                context.read<DropdownBloc>().add(ProjectSelected(value!));

                              },
                            ),
                              const SizedBox(
                                height: AppDimen.SIZE_16,
                              ),
                              _buildDropdownField(
                              label: AppStrings.task,
                              value: selectedTask,
                              items: tasks,
                              onChanged: (value) {
                                context.read<DropdownBloc>().add(TaskSelected(value!));
                              },
                            ),
                              const SizedBox(height: AppDimen.SIZE_16),
                              TextField(
                              onChanged: (value) {
                              context.read<DropdownBloc>().add(DescriptionChanged(value));
                              },
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: AppTextSize.BODY_LARGE_16,
                                ),
                              decoration: InputDecoration(
                              labelText: AppStrings.description,
                              labelStyle: TextStyle(fontSize: AppTextSize.BODY_LARGE_16,color: AppColors.whiteColor),
                              fillColor: Colors.transparent,
                              border:  OutlineInputBorder(
                              borderRadius: const BorderRadius.all(AppDimen.RADIUS_A9),
                                borderSide: BorderSide(color: AppColors.borderColor, width: AppDimen.SIZE_1),
                              ),
                              ),
                              ),
                              const SizedBox(height: AppDimen.SIZE_16),
                              
                              Row(
                                children: [
                                  InkWell(
                                    onTap: (){},
                                      child: Icon(Icons.keyboard_arrow_down_sharp,color: AppColors.whiteColor,)),
                                  SizedBox(width: AppDimen.SIZE_8,),
                                  Text(AppStrings.makeFavorite,style: TextStyle(fontSize: AppDimen.SIZE_16,color: AppColors.whiteColor),)
                                ],
                              )
                            ]
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }));
  }
  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      icon: Icon(Icons.keyboard_arrow_down_sharp),
      iconEnabledColor: AppColors.whiteColor,
      decoration: InputDecoration(
        labelText: label,
        fillColor: Colors.transparent,
        labelStyle: TextStyle(fontSize: AppTextSize.BODY_LARGE_16,color: AppColors.whiteColor),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimen.SIZE_8),
          borderSide: BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimen.SIZE_8),
          borderSide: BorderSide(color: AppColors.borderColor, width: AppDimen.SIZE_2),
        ),
      ),
      items: items.map((item) {
        return DropdownMenuItem<String>(
          value: item,
          child: Text(item),
        );
      }).toList(),
      selectedItemBuilder: (BuildContext context) {
        return items.map<Widget>((item) {
          return Text(
            item,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: AppTextSize.BODY_LARGE_16,
            ),
          );
        }).toList();
      },
    );
  }

  void _createTimer() {
    if (selectedProject != null && selectedTask != null && description.isNotEmpty) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text(AppStrings.timerCreated),
          content: const Text(AppStrings.timerCreatedText),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:  Text(AppStrings.oK),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.timerCreatedText)),
      );
    }
  }
}