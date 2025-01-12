// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, body_might_complete_normally_nullable

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/text_field/custom_text_field_email.dart';
import 'package:almaqsura/custom_wigets/text_field/custom_text_field_pass.dart';
import 'package:almaqsura/futuers/auth/view/creat_account_view.dart';
import 'package:almaqsura/futuers/app_user/u_main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController? name;
  TextEditingController? email;
  TextEditingController? pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 43),
              child: SvgPicture.asset(
                'assets/images/logoo.svg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'تسجيل دخول',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 56, left: 24, right: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFieldEmail(
                    text: 'الاسم',
                    hintText: 'Ahmad Almohammed',
                    icon: SvgPicture.asset(
                      'assets/icons/persson.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    validator: (p0) {},
                    controller: name,
                  ),
                  CustomTextFieldEmail(
                    text: 'الايميل',
                    hintText: 'example.5@gmail.com',
                    icon: SizedBox(
                      child: SvgPicture.asset(
                        'assets/icons/email.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال البريد الإلكتروني';
                      }
                      final emailRegex =
                          RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                      if (!emailRegex.hasMatch(value)) {
                        return 'يرجى إدخال بريد إلكتروني صالح';
                      }
                      return null;
                    },
                    controller: email,
                  ),
                  CustomTextFieldPassword(
                    text: 'كلمة المرور',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'يرجى إدخال كلمة المرور';
                      }

                      if (value.length < 8) {
                        return 'يجب أن تكون كلمة المرور 8 أحرف على الأقل';
                      }

                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';
                      }

                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';
                      }

                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';
                      }

                      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        return 'يجب أن تحتوي كلمة المرور على رمز خاص واحد على الأقل';
                      }

                      return null;
                    },
                    controller: pass,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'هل نسيت كلمة السر؟',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: ColorsApp.primaryColor),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => MainView()));
                },
                child: Container(
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorsApp.primaryColor,
                    borderRadius: BorderRadius.circular(48),
                  ),
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: ColorsApp.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ليس لديك حساب؟',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreatAccountView()));
                    },
                    child: Text(
                      'إنشاء حساب جديد',
                      style: TextStyle(
                        color: ColorsApp.primaryColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'أو',
                      style: TextStyle(
                        color: ColorsApp.customGry,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/google.svg',
                    width: 32.0,
                    height: 32.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  SvgPicture.asset(
                    'assets/images/facebook.svg',
                    width: 32.0,
                    height: 32.0,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: 40,
            // )
          ],
        ),
      ),
    );
  }
}
