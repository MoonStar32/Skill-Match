import 'package:flutter/material.dart';

class ComonTextField extends StatelessWidget {
  const ComonTextField(
      {super.key,
      required this.icon,
      required this.hintText,
      required this.controller,
      this.obscureText = false});

  final IconData icon;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 60,
            decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(
                    bottom: BorderSide(width: 2, color: Color(0xFF6949FF)))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: TextField(
                obscureText: obscureText,
                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                controller: controller,
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
