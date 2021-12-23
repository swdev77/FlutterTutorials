import 'package:e_commerce/components/default_button.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: SizeConfig.screenHeight! * 0.04),
        const Spacer(),
        Image.asset(
          '$kImagesPath/success.png',
          height: SizeConfig.screenHeight! * 0.4,
        ),
        const Spacer(),
        Text(
          'Login Success',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
            width: SizeConfig.screenWidth! * 0.6,
            child: DefaultButton(text: 'Back to Home', press: () {})),
        const Spacer(),
      ],
    );
  }
}
