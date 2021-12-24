import 'package:e_commerce/components/social_media.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/screens/sign_up/components/sign_up_form.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text(
              'Register Account',
              style: headingStyle,
            ),
            const Text(
              'Complete your details or continue \nwith social media',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: SizeConfig.screenHeight! * 0.06),
            SignUpForm(),
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            const SocialMedia(),
            SizedBox(height: SizeConfig.screenHeight! * 0.04),
            const Text(
              'By continuing your confirm that you agree \n with our Term and Condition',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
