import 'package:flutter/material.dart';
import 'package:suitmedia_intern/constant/theme.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: blackTextStyle.copyWith(
        fontWeight: medium,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        hintText: title,
        hintStyle: greyTextStyle.copyWith(
          fontWeight: medium,
          fontSize: 16,
        ),
        fillColor: whiteColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
