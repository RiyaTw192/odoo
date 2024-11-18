import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oddo_fe/core/constants/app_strings.dart';
import 'package:oddo_fe/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:oddo_fe/features/auth/presentation/bloc/authentication_event.dart';
import '../../../../core/constants/app_dimen.dart';
import '../../../../core/constants/custom_widgets/custom_appbar.dart';
import '../../../../core/constants/custom_widgets/custom_button.dart';
import '../../../../core/constants/custom_widgets/custom_gradient_container.dart';
import '../../../../core/constants/custom_widgets/custom_textField.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimen.PADDING_12,
                vertical: AppDimen.PADDING_20),
            child: Column(
              children: [
                CustomAppBar(
                  leadingIcon: Icons.arrow_back,
                  title: AppStrings.oddoLogin,
                ),
                const SizedBox(
                  height: AppDimen.SIZE_40,
                ),
                CustomTextField(
                  hintText: AppStrings.email,
                  onChanged: (email) => context
                      .read<AuthenticationBloc>()
                      .add(EmailValidation(email)),
                ),
                const SizedBox(
                  height: AppDimen.SIZE_30,
                ),
                CustomTextField(
                  hintText: AppStrings.password,
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_red_eye)),
                  onChanged: (password) => context
                      .read<AuthenticationBloc>()
                      .add(PasswordValidation(password)),
                  obscureText: true,
                ),
                const Spacer(),
                CustomButton(
                  buttonName: AppStrings.login,
                  onTap: (){
                    context.go('/timesheet');
                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
