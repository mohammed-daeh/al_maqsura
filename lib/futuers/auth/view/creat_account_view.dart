// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, body_might_complete_normally_nullable

import 'package:almaqsura/colors_app/colors_app.dart';
import 'package:almaqsura/custom_wigets/custom_text_field_email.dart';
import 'package:almaqsura/custom_wigets/custom_text_field_pass.dart';
import 'package:almaqsura/futuers/auth/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreatAccountView extends StatelessWidget {
  CreatAccountView({super.key});
  TextEditingController? email;
  TextEditingController? pass;
  TextEditingController? confirmPassword;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 33),
              child: SvgPicture.asset('assets/images/logo.svg'),
        
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                'إنشاء حساب',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 56, left: 24, right: 24),
              child: Column(children: [
                CustomTextFieldEmail(
                  text: 'الاسم',
                  hintText: 'Ahmad Almohammed',
                  icon: SvgPicture.asset(
                    'assets/icons/persson.svg', fit: BoxFit.scaleDown,
                    // color: ColorsApp.customGry,
                  ),
                  // icon: Icons.person,
                  validator: (p0) {},
                  controller: email,
                ),
                CustomTextFieldEmail(
                  text: 'الايميل',
                  hintText: 'example.5@gmail.com',
                  icon: SvgPicture.asset(
                    'assets/icons/email.svg', fit: BoxFit.scaleDown,
                    // color: ColorsApp.customGry,
                  ),
                  // icon: Icons.email,
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
                CustomTextFieldPassword(
                  text: 'تأكيد كلمة المرور',
                  validator: (p0) {},
                  controller: confirmPassword,
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 56,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorsApp.primaryColor,
                    borderRadius: BorderRadius.circular(48),
                  ),
                  child: Text(
                    'إنشاء حساب',
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
                    'لديك حساب بالفعل؟',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginView()));
                      },
                      child: Text(
                        'سجل الدخول',
                        style: TextStyle(
                            color: ColorsApp.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w300),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      )),
    );
  }
}
