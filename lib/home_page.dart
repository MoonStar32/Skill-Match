import 'package:flutter/material.dart';
import 'screens/test_screens/front_end_test_screen/front_end_test_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToFrontEndTestScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const FrontEndTestScreen();
          },
        ),
      );
    }

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_home_page.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            title: const Text('Tests'),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFBDAEFF),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.perm_identity_rounded,
                      size: 25,
                    ),
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 115,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6949FF),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: const Stack(
                            children: [
                              Image(
                                image: AssetImage('assets/images/html.png'),
                              ),
                              Positioned(
                                right: 10,
                                top: 35,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'HTML',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '15 мин',
                                      style: TextStyle(
                                        color: Color(0xFFB8B3CE),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Container(
                          height: 115,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6949FF),
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/kotlin.png'),
                                height: 60,
                                width: 60,
                              ),
                              Positioned(
                                right: 10,
                                top: 35,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Kotlin',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      '15 мин',
                                      style: TextStyle(
                                        color: Color(0xFFB8B3CE),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: navigateToFrontEndTestScreen,
                    child: Container(
                      height: 115,
                      decoration: BoxDecoration(
                        color: const Color(0xFF6949FF),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage('assets/images/js.png'),
                            height: 60,
                            width: 60,
                          ),
                          Positioned(
                            right: 10,
                            top: 35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Java Script',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '15 мин',
                                  style: TextStyle(
                                    color: Color(0xFFB8B3CE),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color(0xFFB8A9FF),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
