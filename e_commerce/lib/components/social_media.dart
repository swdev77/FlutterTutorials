import 'package:flutter/material.dart';
import '../constants.dart';
import 'social_card.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialCard(
          icon: '$kIconsPath/google-icon.svg',
          press: () {},
        ),
        SocialCard(
          icon: '$kIconsPath/facebook-2.svg',
          press: () {},
        ),
        SocialCard(
          icon: '$kIconsPath/twitter.svg',
          press: () {},
        ),
      ],
    );
  }
}
