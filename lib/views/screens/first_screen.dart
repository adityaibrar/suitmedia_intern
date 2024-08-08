import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_intern/core/provider/user_provider.dart';
import 'package:suitmedia_intern/views/screens/second_screen.dart';
import 'package:suitmedia_intern/views/widgets/custom_button.dart';
import 'package:suitmedia_intern/views/widgets/custom_text_field.dart';

class FirstScreen extends StatefulWidget {
  static const String routeName = '/';
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nameController = TextEditingController(),
      palindromeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/background.png',
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/icons/ic_photo.png',
                      width: 116,
                    ),
                  ),
                  const SizedBox(height: 80),
                  CustomTextField(
                    controller: nameController,
                    title: 'Name',
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: palindromeController,
                    title: 'Palindrome',
                  ),
                  const SizedBox(height: 80),
                  CustomButton(
                    title: 'CHECK',
                    onPressed: () {
                      String sentence = palindromeController.text;
                      bool result =
                          Provider.of<UserProvider>(context, listen: false)
                              .isPalindrome(sentence);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                                result ? 'isPalindrome' : 'not palindrome'),
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomButton(
                    title: 'NEXT',
                    onPressed: () {
                      Provider.of<UserProvider>(context, listen: false)
                          .setName(nameController.text);
                      Navigator.pushNamed(context, SecondScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
