import 'package:flutter/material.dart';

class ProfileRatingWidget extends StatelessWidget {
  final String bottomText;
  final double rating;
  const ProfileRatingWidget({
    super.key,
    required this.rating,
    required this.bottomText
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          rating.toString(),
          style: TextStyle(
            fontSize: 32,
          ),
        ),
        Text(
          bottomText,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
}
