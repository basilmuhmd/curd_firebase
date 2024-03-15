import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String btnText;
  final VoidCallback onTap;
  final Color btnColor;
  final double? width;

  const ButtonWidget({
    super.key,
    required this.btnText,
    required this.btnColor,
    this.width,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        minimumSize: Size(width ?? MediaQuery.sizeOf(context).width * 0.45, 48),
        foregroundColor: Colors.white,
      ),
      child: Text(btnText),
    );
  }
}
