import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/song.dart';
import '../screens/music_screen.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.songs,
    required this.subtitle1,
    required this.background,
    required this.title1,
    required this.subtitle2,
  });

  final String title;
  final String subtitle;
  final String image;
  final String background;
  final List<Song> songs;
  final String title1;
  final String subtitle1;
  final String subtitle2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 450),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
              opacity: animation,
              child: child,
            ),
            pageBuilder: (context, animation, secondaryAnimation) =>
                MusicScreen(
              songs: songs,
              image: image,
              title1: title1,
              subtitle1: subtitle1,
              subtitle2: subtitle2,
              background: background,
            ),
          ),
        );
      },
      child: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight * 0.4,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          color: Colors.black.withOpacity(0.4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.r,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12.r,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
