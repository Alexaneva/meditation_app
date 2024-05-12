import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animation/scale_animation.dart';
import '../animation/slide_animation.dart';
import '../widgets/blur_effect.dart';
import '../widgets/music_tile.dart';
import '../widgets/wave_clip.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ScaleAnimation(
              begin: 1.1,
              child: ClipPath(
                clipper: WaveClip(),
                child: Container(
                  width: double.infinity,
                  height: ScreenUtil().screenHeight * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/tree.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BlurEffect(
                    child: Container(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Back Button
          Positioned(
            top: 40.h,
            left: 10.w,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),

          //Main Body
          Positioned(
            top: 110.h,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    'Killing Anxiety',
                    style: TextStyle(
                      fontSize: 26.r,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: ScreenUtil().screenWidth * 0.8,
                    child: Text(
                      'Calm your anxieties, reduce tension and increase body awarness',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.r,
                        height: 1.5,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ScaleAnimation(
                    begin: 0.8,
                    child: Container(
                      width: 180.r,
                      height: 180.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/yoga.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Free your mind',
                    style: TextStyle(
                      fontSize: 14.r,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    thickness: 0.75,
                    indent: ScreenUtil().screenWidth * 0.25,
                    endIndent: ScreenUtil().screenWidth * 0.25,
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: SlideAnimation(
                      begin: const Offset(0, 100),
                      child: Column(
                        children: <Widget>[
                          const MusicTile(
                            title: 'Behaviour of Mind',
                            length: '2:04',
                            isLocked: false,
                          ),
                          SizedBox(height: 20.h),
                          const MusicTile(
                            title: 'Your Inner Voice',
                            length: '1:56',
                          ),
                          SizedBox(height: 20.h),
                          const MusicTile(
                            title: 'Embrace your emotions',
                            length: '3:12',
                          ),
                          SizedBox(height: 20.h),
                          const MusicTile(
                            title: 'Letting go of everything',
                            length: '2:37',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Bottom Gradient
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SlideAnimation(
              begin: const Offset(0, 50),
              intervalEnd: 0.6,
              child: Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.3),
                      Colors.green.shade100,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
