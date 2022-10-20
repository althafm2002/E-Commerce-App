import 'package:ecommerse/core/constents.dart';
import 'package:ecommerse/screens/authentication/controller/screen_login_provider.dart';
import 'package:ecommerse/screens/authentication/controller/screen_registration_provider.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ScreenRegistration extends StatelessWidget {
  const ScreenRegistration({super.key});

  @override
  Widget build(BuildContext context) {
    final data =
        Provider.of<ScreenRegistrationProvider>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            data.navigatorRegisterBack(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: ConstentsItems.kBlackColor,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: ConstentsItems.kBgColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstentsItems.ksizedBox200,
                Text(
                  'Sign up',
                  style: GoogleFonts.poppins(
                    fontSize: 42,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ConstentsItems.ksizedBox50,
                const TextfeildWidget(
                  text: 'User Name',
                  obscureText: false,
                ),
                ConstentsItems.ksizedBox10,
                const TextfeildWidget(
                  text: 'Email Address',
                  obscureText: false,
                ),
                ConstentsItems.ksizedBox10,
                const TextfeildWidget(
                  text: 'Mobile Phone',
                  obscureText: false,
                ),
                ConstentsItems.ksizedBox10,
                Consumer(builder: (context, ScreenLoginProvider value, child) {
                  return TextfeildWidget(
                    text: 'Password',
                    obscureText: value.passwordVisibility,
                    suffixIcon: IconButton(
                      icon: Icon(
                        value.passwordVisibility
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: ConstentsItems.kBlackColor,
                      ),
                      onPressed: () {
                        value.passWordVisiblity();
                      },
                    ),
                  );
                }),
                ConstentsItems.ksizedBox10,
                Consumer(builder: (context, ScreenLoginProvider value, child) {
                  return const TextfeildWidget(
                    text: 'Conform Password',
                    obscureText: false,
                    // suffixIcon: IconButton(
                    //   icon: Icon(
                    //     value.passwordVisibility
                    //         ? Icons.visibility_off
                    //         : Icons.visibility,
                    //     color: ConstentsItems.k,
                    //   ),
                    //   onPressed: () {
                    //     value.passWordVisiblity();
                    //   },
                    // ),
                  );
                }),
                ConstentsItems.ksizedBox20,
                LongButtonWidget(
                  text: 'Sign up',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
