// import 'package:dalel/core/utils/app_strings.dart';
// import 'package:dalel/core/utils/app_text_styles.dart';

import 'package:flutter/material.dart';
import 'package:learen_3/features/auth/presentation/widgets/custom_check_box.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "iHaveAgreeToOur",
                  // style: CustomTextStyles.poppins400style12
                  ),
              TextSpan(
                  text: "termsAndCondition",
                  // style: CustomTextStyles.poppins400style12
                      // .copyWith(decoration: TextDecoration.underline)
                      ),
            ],
          ),
        ),
      ],
    );
  }
}
