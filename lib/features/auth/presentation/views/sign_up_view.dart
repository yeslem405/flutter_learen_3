// import 'package:dalel/core/functions/navigation.dart';
// import 'package:dalel/core/utils/app_strings.dart';
// import 'package:dalel/features/auth/presentation/widgets/custom_signup_form.dart';
// import 'package:dalel/features/auth/presentation/widgets/have_an_account_widget.dart';
// import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:learen_3/features/auth/presentation/views/sign_in_view.dart';
import 'package:learen_3/features/auth/presentation/widgets/custom_signup_form.dart';
import 'package:learen_3/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:learen_3/features/auth/presentation/widgets/welcome_text_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 152)),
            const SliverToBoxAdapter(
                child: WelcomeTextWidget(text: "welcome")),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            const SliverToBoxAdapter(child: CustomSignUpForm()),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                text1: "alreadyHaveAnAccount",
                text2: "signIn",
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInView(),));
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
