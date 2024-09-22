import 'package:flutter/material.dart';
import 'package:skill_match/auth/screens/sign_in_screen.dart';
import 'package:skill_match/auth/screens/sign_up_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({
    super.key,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return SignInScreen(showSignUpScreen: toggleScreens);
    } else {
      return SignUpScreen(showSignInPage: toggleScreens);
    }
  }
}
