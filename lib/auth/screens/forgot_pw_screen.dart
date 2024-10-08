import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skill_match/components/common_button.dart';
import 'package:skill_match/components/text_field.dart';

class ForgotPaswordScreen extends StatefulWidget {
  const ForgotPaswordScreen({
    super.key,
  });

  @override
  State<ForgotPaswordScreen> createState() => _ForgotPaswordScreenState();
}

class _ForgotPaswordScreenState extends State<ForgotPaswordScreen> {
  final _emailController = TextEditingController();
  String statusMessage = 'You will receive a link to reset your password';
  Color statusColor = Colors.grey;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      setState(() {
        statusMessage = 'Link sent successfully!';
        statusColor = Colors.green;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        statusMessage = e.message.toString();
        statusColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 60),
            //   child: Text('Please enter your email', style: TextStyle(fontSize: 40,), textAlign: TextAlign.center,),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 250, bottom: 10),
              child: ComonTextField(
                icon: Icons.email,
                hintText: 'example@gmail.com',
                controller: _emailController,
              ),
            ),
            Text(
              statusMessage,
              style: TextStyle(
                fontSize: 16,
                color: statusColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CommonButton(
          onTap: passwordReset,
          text: 'Send Link',
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
