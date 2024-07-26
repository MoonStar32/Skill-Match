import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({
    super.key,
    required this.score,
  });
  double score;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 307,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/icons/1_layer_succes.png'),
                    Image.asset('assets/icons/2_layer_succes.png'),
                    Image.asset('assets/icons/succes_mark.png'),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                width: 230,
                child: Column(
                  children: [
                    const Text(
                      'Тест Завершен',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Ваш результат: ${widget.score}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// for (let i in allQuestions) {
//     for (let j in i) {
//         if (isActive && i[j][1] == 1) {
//             result++
//         } else if (isActive && i[j][1] == 0) {
//             result--
//         }
//     }
// }