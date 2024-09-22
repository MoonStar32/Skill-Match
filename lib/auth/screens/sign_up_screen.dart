import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_match/auth/screens/exstra_data_of_user.dart';
import 'package:skill_match/components/common_button.dart';
import 'package:skill_match/components/text_field.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback showSignInPage;
  const SignUpScreen({
    super.key,
    required this.showSignInPage,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          )
          .whenComplete(
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const ExtraData();
                },
              ),
            ),
          );
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38),
            child: CommonButton(
              onTap: signUp,
              text: 'Sign Up'.toUpperCase(),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 320,
                        child: Text(
                          'Добро пожаловать!',
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 48,
                            color: Color(0xFF6949FF),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'New users are always welcome!',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFFA59BD1),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Already a member?',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFA59BD1),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: widget.showSignInPage,
                        child: Container(
                          width: 73,
                          height: 37,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF6949FF),
                          ),
                          child: const Text(
                            'Войти',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Column(
                  children: [
                    ComonTextField(
                      icon: Icons.perm_identity_rounded,
                      hintText: "email",
                      controller: _emailController,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ComonTextField(
                      icon: Icons.lock_outline,
                      hintText: 'password',
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ComonTextField(
                      icon: Icons.lock_open_outlined,
                      hintText: 'confirm password',
                      controller: _confirmPasswordController,
                      obscureText: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
