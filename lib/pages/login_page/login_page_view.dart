
// login field uchun
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kpi_ndqxai/services/constants/app_colors.dart';

class LoginHemisField extends StatelessWidget {
  final TextEditingController loginFieldController;
  LoginHemisField({Key? key, required this.loginFieldController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: 345.w,
      height: 75.h,
      child: TextField(
        controller: loginFieldController,
        keyboardType: TextInputType.number,
        maxLength: 12,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.mainWhiteColor,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: const Icon(
              CupertinoIcons.person,
              size: 25,
              color: AppColors.mainColorGreen,
            ),
            hintText: "Hemis ID",
            hintStyle: const TextStyle(fontSize: 18)),
      ),
    );
  }
}

// password field uchun
 class PasswordField extends StatelessWidget {
  final TextEditingController passwordFieldController;
  PasswordField({Key? key, required this.passwordFieldController}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Container(
       color: AppColors.mainWhiteColor,
       width: 345.w,
       height: 55.h,
       child: TextField(
         controller: passwordFieldController,
         obscureText: true,
         decoration: InputDecoration(
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(10),
             ),
             prefixIcon: const Icon(
               CupertinoIcons.lock,
               size: 25,
               color: AppColors.mainColorGreen,
             ),
             labelStyle: const TextStyle(fontSize: 18),
             hintText: "Parol",
             hintStyle: const TextStyle(fontSize: 18)),
       ),
     );
   }
 }


 // testLogin uchun
class LoginTextField extends StatelessWidget {
  final TextEditingController loginFieldController;
  LoginTextField({Key? key, required this.loginFieldController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345.w,
      height: 75.h,
      child: TextField(
        controller: loginFieldController,
        autofillHints: [AutofillHints.username],
        keyboardType: TextInputType.text,
        maxLength: 12,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.mainWhiteColor,
            isDense: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: const Icon(
              CupertinoIcons.person,
              size: 25,
              color: AppColors.mainColorGreen,
            ),
            hintText: "Login",
            hintStyle: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
