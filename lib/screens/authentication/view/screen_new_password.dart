import 'package:ecommerse/core/constents.dart';
import 'package:ecommerse/screens/authentication/controller/screen_forgetpassword.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenNewPassword extends StatelessWidget {
  const ScreenNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final otpController =
        Provider.of<ScreenForgetPasswordProvider>(context, listen: false);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            otpController.navigatorForgePop(context);
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextfeildWidget(text: 'New Password', obscureText: false),
              ConstentsItems.ksizedBox10,
              const TextfeildWidget(
                  text: 'Conform Password', obscureText: false),
              ConstentsItems.ksizedBox20,
              LongButtonWidget(
                text: 'SAVE',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
