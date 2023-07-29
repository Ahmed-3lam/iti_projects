import 'package:flutter/material.dart';

Widget buildButton({
  required String text,
  required Color textColor,
  required Color btnColor,
  void Function()? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 56,
      width: 374,
      decoration: BoxDecoration(
          color: btnColor, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    ),
  );
}
