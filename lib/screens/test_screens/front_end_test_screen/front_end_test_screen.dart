import 'package:flutter/material.dart';

import 'package:flutter_countdown_timer/index.dart';
import 'package:skill_match/screens/results_screen/results_screen.dart';
import 'package:skill_match/screens/test_screens/front_end_test_screen/front_end_test_screen_model.dart';

//TODO
class FrontEndTestScreen extends StatefulWidget {
  const FrontEndTestScreen({super.key});

  @override
  State<FrontEndTestScreen> createState() => _FrontEndTestScreenState();
}

class _FrontEndTestScreenState extends State<FrontEndTestScreen> {
  late CountdownTimerController timerController;
  int endTime = DateTime.now().millisecondsSinceEpoch +
      const Duration(minutes: 15, seconds: 10).inMilliseconds;
  void onEnd() {}

  late PageController _controller;

  @override
  void initState() {
    super.initState();
    timerController = CountdownTimerController(endTime: endTime, onEnd: onEnd);
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    timerController.dispose();
    super.dispose();
  }

  void resetNumberPage() {
    setState(() {
      _controller.jumpToPage(questionNumber);
    });
  }

  void resetQuestionNumber() {
    setState(() {
      questionNumber = 1;
    });
  }

  void increaseQuestionNumber() {
    setState(() {
      questionNumber++;
    });
  }

  void increaseTopicsIndex() {
    setState(() {
      topicsIndex++;
    });
  }

  void decreaseQuestionNumber() {
    setState(() {
      questionNumber -= 1;
    });
  }

  int topicsIndex = 0;

  int questionNumber = 1;

  void navigateToResult() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ResultScreen(
            score: finalScore,
          );
        },
      ),
    );
  }

  double finalScore = 0;

  void countScore() {
    int i = 0;
    int j = 0;
    double totalScore = 0;

    while (i < allQuestions[topicsIndex].length) {
      while (j < allQuestions[topicsIndex][i].options.length) {
        if (allQuestions[topicsIndex][i].options[j].isActive == true &&
            allQuestions[topicsIndex][i].options[j].weight == 1) {
          totalScore++;
          print("+1");
        }
        if (allQuestions[topicsIndex][i].options[j].isActive == true &&
            allQuestions[topicsIndex][i].options[j].weight == -1) {
          totalScore--;
          print("-1");
        }

        j++;
        print("j = $j");
        print(totalScore);
      }
      print("i = $i");
      i++;
    }
    finalScore = totalScore;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff6949FF),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
              child: TextButton(
                  onPressed: countScore,
                  child: const Text(
                    'Запринтить длину вопросов в теме',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: const Color(0xff6949FF), width: 3)),
                  width: 340,
                  child: LinearProgressIndicator(
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.green),
                    minHeight: 8,
                    value: questionNumber / allQuestions[topicsIndex].length,
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: CountdownTimer(
                  controller: timerController,
                  endTime: endTime,
                  textStyle: const TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  widgetBuilder:
                      (BuildContext context, CurrentRemainingTime? time) {
                    if (time == null) {
                      return AlertDialog(
                        title: const Text('Time is out'),
                        content: Container(),
                        actions: [
                          TextButton(
                              onPressed: navigateToResult,
                              child: const Text('Перейти к результатам теста'))
                        ],
                      );
                    }
                    return Stack(
                      children: [
                        Positioned(
                          left: 163,
                          child: Text(
                            '${time.min != null ? time.min! < 10 ? '0${time.min.toString()}' : time.min.toString() : '00'} : ${time.sec! % 60}',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 350,
                          child: Container(
                            padding: const EdgeInsets.only(),
                            height: 460,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: PageView.builder(
                              controller: _controller,
                              scrollDirection: Axis.horizontal,
                              itemCount: allQuestions[topicsIndex].length,
                              itemBuilder: (context, index) {
                                final question =
                                    allQuestions[topicsIndex][index];

                                return buildQuestion(question);
                              },
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 35,
                          child: Container(
                            width: 345,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: const Color(0xff6949FF),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (questionNumber == 1) {
                                      Navigator.pop(context);
                                    } else {
                                      _controller.previousPage(
                                        duration:
                                            const Duration(milliseconds: 250),
                                        curve: Curves.bounceIn,
                                      );
                                      decreaseQuestionNumber();
                                    }
                                  },
                                  icon: questionNumber == 1
                                      ? Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                                'assets/icons/purple_fon.png'),
                                            Image.asset(
                                                'assets/icons/whie_fon_home.png'),
                                            // Image.asset(
                                            //     'assets/icons/home_icon.png'),
                                            const Icon(
                                              Icons.home_filled,
                                              size: 30,
                                            ),
                                          ],
                                        )
                                      : Container(
                                          width: 38,
                                          height: 38,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                              'assets/icons/icon_back_arrow.png'),
                                        ),
                                ),
                                IconButton(
                                  onPressed: () => {
                                    if (questionNumber <=
                                        allQuestions[topicsIndex].length)
                                      {
                                        _controller.nextPage(
                                          duration:
                                              const Duration(milliseconds: 250),
                                          curve: Curves.easeInExpo,
                                        ),
                                        increaseQuestionNumber(),
                                        countScore(),
                                      },
                                    if (allQuestions[topicsIndex].length + 1 ==
                                        questionNumber)
                                      {
                                        resetQuestionNumber(),
                                        increaseTopicsIndex(),
                                        resetNumberPage(),
                                      },
                                    if (allQuestions[topicsIndex].length == 1)
                                      {
                                        navigateToResult(),
                                      }
                                  },
                                  icon: Container(
                                    width: 38,
                                    height: 38,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                        'assets/icons/icon_forward_arrow.png'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 100,
                          left: 190,
                          child: Text(
                            "$questionNumber/${allQuestions[topicsIndex].length}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Stack buildQuestion(Question question) {
    return Stack(
      children: [
        Positioned(
          top: 20,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Flexible(
              child: Text(
                question.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 50,
          top: 300,
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 240,
                child: OptionWidget(
                  question: question,
                  onClickedOption: (option) {
                    option.isActive == true
                        ? option.isActive = false
                        : option.isActive = true;
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class OptionWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;
  const OptionWidget({
    super.key,
    required this.question,
    required this.onClickedOption,
  });
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: question.options
              .map((option) => buildOption(context, option))
              .toList(),
        ),
      ),
    );
  }
}

Widget buildOption(
  BuildContext context,
  Option option,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: GestureDetector(
      onTap: () => option.isActive == true
          ? option.isActive = false
          : option.isActive = true,
      child: Container(
        width: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: option.isActive == true
              ? const Color(0xff6949FF)
              : const Color(0xffF0EDFF),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Flexible(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    option.text,
                    style: TextStyle(
                      fontSize: 20,
                      color: option.isActive == true
                          ? Colors.white
                          : const Color(0xff876DFF),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
