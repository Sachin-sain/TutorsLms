import 'package:flutter/material.dart';

class OnboardingData extends StatefulWidget {
  final String imagePath;

  OnboardingData({super.key, required this.imagePath});

  @override
  OnboardingDataState createState() => OnboardingDataState(this.imagePath);
}

class OnboardingDataState extends State<OnboardingData> {
  final String imagePath;
  OnboardingDataState(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.cover,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.6,
      image: AssetImage(imagePath),
    );
  }
}