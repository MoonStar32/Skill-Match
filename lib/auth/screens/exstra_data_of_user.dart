import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:skill_match/components/common_button.dart';
import 'package:skill_match/components/text_field.dart';
import 'package:skill_match/home_page.dart';

class ExtraData extends StatefulWidget {
  const ExtraData({
    super.key,
  });

  @override
  State<ExtraData> createState() => _ExtraDataState();
}

class _ExtraDataState extends State<ExtraData> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final aboutMeController = TextEditingController();
  String? direction;
  String? lvl;
  final contactController = TextEditingController();
  late final String value;

  @override
  void dispose() {
    aboutMeController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    contactController.dispose();
    super.dispose();
  }

  final itemsDir = ['Front', 'Back', 'Mobile'];

  final itemsLvl = ['Junior', 'Middle', 'Senior'];

  DropdownMenuItem<String> buidlMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CommonButton(
              onTap: () async {
                try {
                  await FirebaseFirestore.instance.collection('users').add(
                    {
                      'first name': firstNameController.text.trim(),
                      'last name': lastNameController.text.trim(),
                      'about me': aboutMeController.text.trim(),
                      'contacts': contactController.text.trim(),
                      'direction': direction!,
                    },
                  ).whenComplete(
                    () => print(''),
                  );
                } catch (e) {
                  print(e);
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ),
                );
              },
              text: 'Приступить к тестам',
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 60,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Заполните анкету',
                    style: TextStyle(
                      fontSize: 48,
                      color: Color(0xFF6949FF),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ComonTextField(
                    icon: Icons.perm_identity_rounded,
                    hintText: "Имя",
                    controller: firstNameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ComonTextField(
                    icon: Icons.lock_outline,
                    hintText: 'Фамилия',
                    controller: lastNameController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ComonTextField(
                    icon: Icons.lock_open_outlined,
                    hintText: 'Обо мне',
                    controller: aboutMeController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ComonTextField(
                    icon: Icons.lock_outline,
                    hintText: 'Контакты',
                    controller: contactController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Color(0xFF6949FF),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Text('Back, Front ...'),
                          dropdownColor: Colors.white,
                          value: value,
                          isExpanded: true,
                          items: itemsDir.map(buidlMenuItem).toList(),
                          onChanged: (value) => setState(
                            () {
                              this.value = value!;
                              direction = value;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                  // const SizedBox(height: 20,),

                  // Container(
                  //   alignment: Alignment.center,
                  //   height: 60,
                  //   decoration: const BoxDecoration(
                  //     color: Colors.transparent,
                  //     border: Border(bottom: BorderSide(
                  //       width: 2,
                  //       color: Color(0xFF6949FF)
                  //     ))
                  //     ),
                  //   child:  Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 0),
                  //     child: DropdownButtonHideUnderline(
                  //       child: DropdownButton<String> (
                  //         hint: const Text('Junior, Middle, Senior'),
                  //         dropdownColor: Colors.white,
                  //         value: value,
                  //         isExpanded: true,
                  //         items: itemsLvl.map(buidlMenuItem).toList(),
                  //         onChanged: (value) => setState(() {
                  //         this.value = value;
                  //         lvl = value;
                  //         }),
                  //       ),
                  //     )
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
