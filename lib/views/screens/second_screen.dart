import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_intern/constant/theme.dart';
import 'package:suitmedia_intern/core/provider/user_provider.dart';
import 'package:suitmedia_intern/views/screens/third_screen.dart';

class SecondScreen extends StatefulWidget {
  static const String routeName = '/second-screen';
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Second Screen',
          style: blackTextStyle.copyWith(
            fontWeight: semibold,
            fontSize: 16,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    Provider.of<UserProvider>(context).name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semibold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Center(
                child: Text(
                  'Selected User Name ${Provider.of<UserProvider>(context).selectedUserName}',
                  style: blackTextStyle.copyWith(
                    fontWeight: semibold,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: primaryColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, ThirdScreen.routeName);
          },
          child: Text(
            'Choose a User',
            style: whiteTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
