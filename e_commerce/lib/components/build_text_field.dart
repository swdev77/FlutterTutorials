import 'package:flutter/material.dart';

import '../constants.dart';
import 'custom_suffix_icon.dart';

class BuildTextField {
  TextFormField _buildEmailFormField(List<String> errors) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      //onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        // if ((value.isNotEmpty) && errors.contains(kEmailNullError)) {
        //   setState(() {
        //     errors.remove(kEmailNullError);
        //   });
        // } else if (emailValidatorRegExp.hasMatch(value.toString()) &&
        //     errors.contains(kInvalidEmailError)) {
        //   setState(() {
        //     errors.remove(kInvalidEmailError);
        //   });
        // }
      },
      validator: (value) {
        // if ((value == null || value.isEmpty) &&
        //     !errors.contains(kEmailNullError)) {
        //   setState(() {
        //     errors.add(kEmailNullError);
        //   });
        //   return '';
        // } else if (!emailValidatorRegExp.hasMatch(value.toString()) &&
        //     !errors.contains(kInvalidEmailError)) {
        //   setState(() {
        //     errors.add(kInvalidEmailError);
        //   });
        //   return '';
        // }
        // return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Enter you email',
        suffixIcon: Padding(
          padding: edgeInsets,
          child: const CustomSuffixIcon(icon: '$kIconsPath/Mail.svg'),
        ),
      ),
    );
  }

}