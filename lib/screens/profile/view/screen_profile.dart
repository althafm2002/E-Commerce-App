import 'package:ecommerse/helpers/spacing_widget.dart';
import 'package:ecommerse/helpers/text_style_widget.dart';
import 'package:ecommerse/screens/profile/controller/screen_profile_provider.dart';
import 'package:ecommerse/widget/long_button_widget.dart';
import 'package:ecommerse/widget/textfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ScreenProfileProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            data.popPage(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'EDIT PROFILE',
          style: AppTextStyle.kTextSize18Black,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.ksizedBox30,
              const TextfeildWidget(text: 'FULL NAME', obscureText: false),
              AppSpacing.ksizedBox10,
              const TextfeildWidget(
                text: 'EMAIL',
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
              ),
              AppSpacing.ksizedBox10,
              const TextfeildWidget(
                text: 'MOBILE NUMBER',
                obscureText: false,
                keyboardType: TextInputType.phone,
              ),
              AppSpacing.ksizedBox30,
              GestureDetector(
                  onTap: () {}, child: const LongButtonWidget(text: 'UPDATE')),
              AppSpacing.ksizedBox130,
              TextButton(
                onPressed: () {
                  data.navogationToChangePassword(context);
                },
                child: const Text(
                  'Change Passsword',
                  style: AppTextStyle.kTextBlack,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Log Out',
                  style: AppTextStyle.kTextBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
