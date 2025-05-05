// import 'package:dalel/core/functions/navigation.dart';
// import 'package:dalel/core/utils/app_strings.dart';
// import 'package:dalel/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:learen_3/features/auth/presentation/views/forgot_password_view.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ForgotPasswordView(),));
        // customReplacementNavigate(context, "/forgotPassword");
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "forgotPassword",
          // style: CustomTextStyles.poppins600style28.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
