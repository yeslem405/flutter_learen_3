
// import 'package:dalel/core/functions/navigation.dart';
// import 'package:dalel/core/utils/app_colors.dart';
// import 'package:dalel/core/utils/app_strings.dart';
// import 'package:dalel/core/widgets/custom_btn.dart';
// import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
// import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
// import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
// import 'package:dalel/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learen_3/core/functions/custom_toast.dart';
import 'package:learen_3/core/widgets/custom_btn.dart';
import 'package:learen_3/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:learen_3/features/auth/presentation/cubit/auth_state.dart';
import 'package:learen_3/features/auth/presentation/views/sign_in_view.dart';
import 'package:learen_3/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:learen_3/features/auth/presentation/widgets/terms_and_condition_widget.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignupSuccessState) {
          showToast("Successfully,Check your email to verfiy your account");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInView(),));
        } else if (state is SignupFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signupFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: "fristName",
                onChanged: (fristName) {
                  authCubit.fristName = fristName;
                },
              ),
              CustomTextFormField(
                labelText: "lastName",
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                labelText: "emailAddress",
                onChanged: (email) {
                  authCubit.emailAddress = email;
                },
              ),
              CustomTextFormField(
                labelText: "password",
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.obscurePasswordTextValue == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                ),
                obscureText: authCubit.obscurePasswordTextValue,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const TermsAndConditionWidget(),
              const SizedBox(height: 88),
              state is SignupLoadingState
                  ? CircularProgressIndicator(color: Colors.white)
                  : CustomBtn(
                      color: authCubit.termsAndConditionCheckBoxValue == false
                          ? Colors.grey
                          : null,
                      onPressed: () async{
                        if (authCubit.termsAndConditionCheckBoxValue == true) {
                          if (authCubit.signupFormKey.currentState!
                              .validate()) {
                           await authCubit.signUpWithEmailAndPassword();
                          }
                        }
                      },
                      text: "signUp"),
            ],
          ),
        );
      },
    );
  }
}
