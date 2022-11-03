import 'package:ecommerse/screens/authentication/model/signin/sign_in_model.dart';
import 'package:ecommerse/screens/authentication/service/signin/sign_in_service.dart';
import 'package:ecommerse/screens/bottomnavigation/view/bottom_navigation.dart';
import 'package:ecommerse/utils/app_popups.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ScreenLoginProvider with ChangeNotifier {
  bool passwordVisibility = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  void passWordVisiblity() {
    passwordVisibility = !passwordVisibility;
    notifyListeners();
  }

  String? validator(String? value, String text) {
    if (value == null || value.isEmpty) {
      return text;
    }
    return null;
  }

  void userSignIn(context, GlobalKey<FormState> formKey) async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final signInUser = SignInModel(
        email: emailController.text,
        password: passwordController.text,
      );

      await SignInService.signUpService(signInUser).then(
        (value) {
          if (value != null) {
            AppPopUps.showToast('Logged Successfully', Colors.green);
            Get.offAll(() => const ScreenBottomNavbar());
            disposeFeildText();
          } else {
            return;
          }
        },
      );
      isLoading = false;
      notifyListeners();
    }
  }

  void disposeFeildText() {
    passwordController.clear();
    emailController.clear();
  }
}
