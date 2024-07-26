import 'package:flutter/material.dart';

class TestChooseScreen extends StatefulWidget {
  const TestChooseScreen({super.key});

  @override
  State<TestChooseScreen> createState() => _TestChooseScreenState();
}

class _TestChooseScreenState extends State<TestChooseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Выберите тест'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
