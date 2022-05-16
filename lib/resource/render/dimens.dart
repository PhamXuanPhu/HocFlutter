import 'dart:math';
import 'package:get/get.dart';
const guidelineBaseWidth = 1080;
const guidelineBaseHeight = 2340;

double get screenWidth => Get.width; //1800
double get screenHeight => Get.height; //2560

double get scaleWidth => screenWidth / guidelineBaseWidth;
double get scaleHeight => screenHeight / guidelineBaseHeight;

double get scaleText => min(scaleWidth, scaleHeight);

extension ScreenExtension on num {
  double get w => this * scaleWidth; // Width Scale
  double get h => this * scaleHeight; // Height Scale
  double get t => this * scaleText; // Text Scale
  double get r => this * scaleText; // Radius Scale
  double get wf => this * screenWidth;
  double get hf => this * screenHeight;
}