import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_corner/smooth_corner.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothContainer(
      width: double.infinity,
      height: 48.r,
      child: ElevatedButton(
        onPressed: () => {}, //TODO: Burası halledilecek
        style: Theme.of(context).elevatedButtonTheme.style,
        child: Text("Generate"),
      ),
    );
  }
}
