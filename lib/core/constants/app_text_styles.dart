import 'package:flutter/material.dart';
import 'app_colors.dart';

//Estilos de texto
class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );
  static const TextStyle headline = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );
  static const TextStyle body = TextStyle(fontSize: 16, color: AppColors.text);
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    color: AppColors.text,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.text,
  );
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textLight,
  );
}
