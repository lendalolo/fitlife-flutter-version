
import 'package:flutter/material.dart';
import '../common/colo_extension.dart';
import 'custom_text_feild_prefix_icon.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hitText;
  final IconData icon;
  final Widget? rigtIcon;
  final bool obscureText;
  final EdgeInsets? margin;
  final Decoration? decoration;
 final String? Function(String?)? validator;
  final void Function(String)? onchanged;
  const CustomTextField({super.key,  required this.hitText, required this.icon, this.controller, this.margin, this.keyboardType, this.obscureText = false , this.rigtIcon, this.validator, this.onchanged, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: decoration ?? BoxDecoration(
          color: TColor.lightGray, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        onChanged: onchanged,
        validator:validator ,
        controller: controller,
        cursorColor: TColor.primaryColor1,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          errorBorder:  InputBorder.none,
            focusedErrorBorder:InputBorder.none ,
            errorStyle: TextStyle(color: TColor.primaryColor1),
            // focusColor: TColor.primaryColor2,
            // floatingLabelStyle: TextStyle(color: TColor.primaryColor1),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: hitText,
            suffixIcon: rigtIcon,
            prefixIcon: CustomTextFieldPrefixIcon(icon: icon),
            hintStyle: TextStyle(color: TColor.gray, fontSize: 12)),
      ),
    );
  }
}

