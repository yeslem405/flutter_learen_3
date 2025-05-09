// import 'package:dalel/core/functions/navigation.dart';
// import 'package:dalel/core/utils/app_strings.dart';
// import 'package:dalel/features/auth/presentation/widgets/custom_signin_form.dart';
// import 'package:dalel/features/auth/presentation/widgets/have_an_account_widget.dart';
// import 'package:dalel/features/auth/presentation/widgets/welcome_banner.dart';
// import 'package:dalel/features/auth/presentation/widgets/welcome_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:learen_3/features/auth/presentation/widgets/custom_signin_form.dart';
import 'package:learen_3/features/auth/presentation/widgets/have_an_account_widget.dart';
import 'package:learen_3/features/auth/presentation/widgets/welcome_banner.dart';
import 'package:learen_3/features/auth/presentation/widgets/welcome_text_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: WelcomeBanner(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          const SliverToBoxAdapter(
            child: WelcomeTextWidget(text:"welcomeBack"),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomSignInForm(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: HaveAnAccountWidget(
              text1: "dontHaveAnAccount",
              text2: "signUp",
              onTap: () {
                // customReplacementNavigate(context, "/signUp");
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInView(),));
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
