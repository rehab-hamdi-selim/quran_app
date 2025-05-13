import 'package:flutter/material.dart';
import 'package:quran_app/core/utils/myConstants.dart';

class BottomIconsImage extends StatelessWidget {
  const BottomIconsImage({super.key, required this.imageName, this.color});
  final String imageName;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    double screenHeight = ScreenUtils.getScreenHeight(context);
    double screenWidth = ScreenUtils.getScreenWidth(context);
    return Image.asset(
      imageName,
      color: color,
      height: screenHeight * 0.04,
      width: screenWidth * 0.08,
    );
  }
}
