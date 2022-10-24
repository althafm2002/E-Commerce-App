import 'package:ecommerse/helpers/colors_widget.dart';
import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/authentication/controller/screen_login_provider.dart';
import 'package:ecommerse/screens/authentication/widget/button_bottom.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenLoginProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      data.disposeFeildText();
    });
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.kBgColor,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppSpacing.ksizedBox130,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign in',
                        style: GoogleFonts.poppins(
                            fontSize: 42, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  AppSpacing.ksizedBox30,
                  TextfeildWidget(
                    controller: data.emailController,
                    validator: (value) =>
                        EmailValidator.validate(value.toString())
                            ? null
                            : "Please enter a valid email",
                    text: 'Email',
                    obscureText: false,
                  ),
                  AppSpacing.ksizedBox10,
                  Consumer(
                    builder: (context, ScreenLoginProvider value, child) {
                      return TextfeildWidget(
                        controller: data.passwordController,
                        validator: (value) =>
                            data.validator(value, 'Please Enter Password'),
                        text: 'Enter Password',
                        keyboardType: TextInputType.text,
                        obscureText: value.passwordVisibility,
                        suffixIcon: IconButton(
                          icon: Icon(
                            value.passwordVisibility
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColors.kBlackColor,
                          ),
                          onPressed: () {
                            value.passWordVisiblity();
                          },
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          data.navigatorLoginToForget(context);
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: AppTextStyle.kTextBlack16,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.ksizedBox10,
                  LongButtonWidget(
                    text: 'Sign in',
                    onTap: () {
                      data.userSignIn(context, formKey);
                    },
                  ),
                  AppSpacing.ksizedBox40,
                  ButtonBottomSide(
                    onTap: () {
                      data.navigatorLoginToRegister(context);
                    },
                    richText: 'Sign up',
                    text: "Don't Have an Account?",
                    height: 125,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
