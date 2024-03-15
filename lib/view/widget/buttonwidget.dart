import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  final Color btnColor;

  const ButtonWidget({
    super.key,
    required this.btnText,
    required this.btnColor,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: btnColor),
      child: Text(btnText),
    );
  }
}
