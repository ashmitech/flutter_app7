import 'package:flutter/material.dart';

class LatestNewsHeading extends StatelessWidget {
  final String headingText;
  final EdgeInsets horizontalPadding;
  final TextStyle textStyle;

  const LatestNewsHeading({
    super.key,
    required this.headingText,
    this.horizontalPadding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.textStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: textStyle,
    );
  }
}