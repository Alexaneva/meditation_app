import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animation/fade_animation.dart';
import '../animation/scale_animation.dart';
import '../animation/slide_animation.dart';
import '../models/song.dart';
import '../widgets/activity_card.dart';
import '../widgets/bottom_quote.dart';
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
                child: ActivityCard(
                  image: 'assets/images/ocean.jpeg',
                  title: 'Sensations',
                  subtitle: 'Feel the moments',
                  songs: [
                    Song(
                        name: 'Night Sounds Bring Healing',
                        length: '2:21',
                        audioUrl: 'music/healing.mp3'),
                    Song(
                        name: 'Reiki Tribe',
                        length: '3:23',
                        audioUrl: 'music/reiki.mp3'),
                    Song(
                        name: 'Song from Tibet',
                        length: '3:14',
                        audioUrl: 'music/tibet.mp3'),
                    Song(
                        name: 'Water Healing',
                        length: '1:57',
                        audioUrl: 'music/water-healing'),
                  ],
                  subtitle1: 'Calm your anxieties, reduce tension and increase body awareness',
                  background: 'assets/images/tree.jpeg',
                  title1: 'Killing Anxiety',
                  subtitle2: 'Free your mind',
                ),
              ),
            ),
          ),
          Positioned(
            top: ScreenUtil().screenHeight * 0.26,
            left: 0,
            child: ScaleAnimation(
              begin: 0.7,
              intervalEnd: 0.6,
              child: ClipPath(
                clipper: WaveClip(),
                child: ActivityCard(
                  title: 'Daydream',
                  subtitle: 'go beyond the Form',
                  image: 'assets/images/sky.jpeg',
                  songs: [
                    Song(
                        name: 'Night Sounds Bring Healing',
                        length: '2:21',
                        audioUrl: 'music/healing.mp3'),
                    Song(
                        name: 'Reiki Tribe',
                        length: '3:23',
                        audioUrl: 'music/reiki.mp3'),
                    Song(
                        name: 'Song from Tibet',
                        length: '3:14',
                        audioUrl: 'music/tibet.mp3'),
                    Song(
                        name: 'Water Healing',
                        length: '1:57',
                        audioUrl: 'music/water-healing'),
                  ],
                    subtitle1: 'Daydreams are free thoughts and images conjured up by our minds',
                    background: 'assets/images/palm.jpg',
                    title1: 'Daydreaming your experience',
                    subtitle2: 'Visualise',
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: ScaleAnimation(
              begin: 0.8,
              intervalEnd: 0.4,
              child: ClipPath(
                clipper: WaveClip(),
                child: ActivityCard(
                  image: 'assets/images/desert.jpeg',
                  title: 'Meditation',
                  subtitle: 'discover happiness',
                  songs: [
                    Song(
                        name: 'Night Sounds Bring Healing',
                        length: '2:21',
                        audioUrl: 'music/healing.mp3'),
                    Song(
                        name: 'Reiki Tribe',
                        length: '3:23',
                        audioUrl: 'music/reiki.mp3'),
                    Song(
                        name: 'Song from Tibet',
                        length: '3:14',
                        audioUrl: 'music/tibet.mp3'),
                    Song(
                        name: 'Water Healing',
                        length: '1:57',
                        audioUrl: 'music/water-healing'),
                  ],
                  subtitle1: 'Brilliant things happen in calm minds',
                  background: 'assets/images/yoga.jpeg',
                  title1: 'Now is good',
                  subtitle2: 'Look up and smile',
                ),
              ),
            ),
          ),
          Positioned(
            width: ScreenUtil().screenWidth,
            bottom: 30.h,
            child: const SlideAnimation(
              begin: Offset(0, 100),
              child: FadeAnimation(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BottomIcon(
                      icon: Icons.center_focus_strong,
                      title: 'Focus',
                      isSelected: false,
                    ),
                    BottomIcon(
                      icon: Icons.music_note,
                      title: 'Relax',
                      isSelected: true,
                    ),
                    BottomIcon(
                      icon: Icons.nightlight,
                      title: 'Focus',
                      isSelected: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
