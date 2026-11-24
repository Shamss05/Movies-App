import 'dart:ui';

import 'package:flutter/material.dart';

class OnboardingData {
  final String imagePath;
  final String title;
  final String description;
  final String primaryButtonText;
  final List<Color> gradientColors ;



  OnboardingData({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.primaryButtonText,
    required this.gradientColors,
  });
}