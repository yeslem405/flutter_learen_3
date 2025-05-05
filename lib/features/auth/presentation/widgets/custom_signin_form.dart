// import 'package:dalel/core/functions/custom_toast.dart';
// import 'package:dalel/core/functions/navigation.dart';
// import 'package:dalel/core/utils/app_colors.dart';
// import 'package:dalel/core/utils/app_strings.dart';
// import 'package:dalel/core/widgets/custom_btn.dart';
// import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
// import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
// import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
// import 'package:dalel/features/auth/presentation/widgets/forgot_password_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learen_3/core/functions/custom_toast.dart';
import 'package:learen_3/core/widgets/custom_btn.dart';
import 'package:learen_3/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:learen_3/features/auth/presentation/cubit/auth_state.dart';
import 'package:learen_3/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:learen_3/features/auth/presentation/widgets/forgot_password_text_widget.dart';
import 'package:learen_3/features/home/view/homescreen.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SigninSuccessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ?  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),))
              : showToast("Please Verify Your Account");
        } else if (state is SigninFailureState) {
          showToast(state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signinFormKey,
          child: Column(
            children: [
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
              const SizedBox(height: 16),
              const ForgotPasswordTextWidget(),
              const SizedBox(height: 102),
              state is SigninLoadingState
                  ? CircularProgressIndicator(color:Colors.blue)
                  : CustomBtn(
                      onPressed: () async {
                        if (authCubit.signinFormKey.currentState!.validate()) {
                          await authCubit.sigInWithEmailAndPassword();
                        }
                      },
                      text: "signIn"),
            ],
          ),
        );
      },
    );
  }
}
