import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../animation/scale_animation.dart';
import '../animation/slide_animation.dart';
import '../models/song.dart';
import '../widgets/blur_effect.dart';
import '../widgets/wave_clip.dart';

class MusicScreen extends StatefulWidget {
  final List<Song> songs;
  final String image;
  final String background;
  final String title1;
  final String subtitle1;
  final String subtitle2;
  const MusicScreen({super.key, required this.songs, required this.image, required this.title1, required this.subtitle1, required this.subtitle2, required this.background});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int currentIndex = -1;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

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
                    image: DecorationImage(
                      image: AssetImage(widget.background),
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
                    widget.title1,
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
                      widget.subtitle1,
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
                        image: DecorationImage(
                          image: AssetImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    widget.subtitle2,
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: widget.songs.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    IconButton(
                                      icon: currentIndex == index
                                          ? const Icon(Icons.pause)
                                          : const Icon(Icons.play_arrow),
                                      onPressed: () {
                                        setState(() {
                                          if (currentIndex == index) {
                                            stopMusic();
                                            currentIndex = -1;
                                          } else {
                                            playMusic(widget.songs[index].audioUrl);
                                            currentIndex = index;
                                          }

                                        });
                                      },
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      widget.songs[index].name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      widget.songs[index].length,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
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

  void playMusic(String url) async {
    await audioPlayer.play(AssetSource(url));
    isPlaying = true;
  }

  void stopMusic() {
    audioPlayer.stop();
    isPlaying = false;
  }
}
