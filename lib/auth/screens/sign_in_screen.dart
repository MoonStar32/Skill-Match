import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_match/auth/screens/exstra_data_of_user.dart';

import '../../components/common_button.dart';
import '../../components/text_field.dart';
import 'forgot_pw_screen.dart';

class SignInScreen extends StatefulWidget {
  final VoidCallback showSignUpScreen;
  const SignInScreen({super.key, required this.showSignUpScreen});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ExtraData();
    }));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 53),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                          width: 300,
                          child: Text(
                            'Welcome back!',
                            style: TextStyle(
                                fontSize: 48,
                                color: Color(0xFF6949FF),
                                fontWeight: FontWeight.w700),
                          )),
                      const SizedBox(
                        height: 10,
                      ),

                      //Text('Glad to see you again!', style: TextStyle(fontSize: 12, color: Colors.white),),

                      //SizedBox(height: 20,),

                      const Text(
                        'Not a member?',
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFA59BD1),
                            fontWeight: FontWeight.w700),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      GestureDetector(
                        onTap: widget.showSignUpScreen,
                        child: Container(
                          width: 173,
                          height: 37,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xFF6949FF),
                          ),
                          child: const Text(
                            'Зарегестрироваться',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ComonTextField(
                        icon: Icons.perm_identity_rounded,
                        hintText: "email",
                        controller: _emailController),
                    const SizedBox(
                      height: 40,
                    ),
                    ComonTextField(
                      icon: Icons.lock_outline,
                      hintText: 'password',
                      controller: _passwordController,
                      obscureText: true,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const ForgotPaswordScreen();
                                }));
                              },
                              child: const Text(
                                'I forgot my password',
                                style: TextStyle(
                                    color: Color(0xFFA59BD1),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
                CommonButton(onTap: signIn, text: 'Sign In'.toUpperCase())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
