import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animation/scale_animation.dart';
import '../widgets/activity_card.dart';
import '../widgets/wave_clip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/images/desert.jpeg'), context);
    precacheImage(const AssetImage('assets/images/sky.jpeg'), context);
    precacheImage(const AssetImage('assets/images/ocean.jpeg'), context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: ScreenUtil().screenHeight * 0.52,
            left: 0,
            child: ScaleAnimation(
              child: ClipPath(
                clipper: WaveClip(),
                child: const ActivityCard(
                  image: 'assets/images/ocean.jpeg',
                  title: 'Sensations',
                  subtitle: 'Feel the moments',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
