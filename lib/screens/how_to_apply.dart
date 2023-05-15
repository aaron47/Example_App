import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../widgets/nails/custom_app_bar.dart';

class HowToApplyScreen extends StatefulWidget {
  const HowToApplyScreen({super.key});

  @override
  State<HowToApplyScreen> createState() => _HowToApplyScreenState();
}

class _HowToApplyScreenState extends State<HowToApplyScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();

    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.asset("assets/nail_video.mp4")..initialize().then((_) => setState(() {}));
    _createChewieController();
  }

  void _createChewieController() {
    _chewieController = ChewieController(videoPlayerController: _videoPlayerController);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  RightSide(chewieController: _chewieController),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({
    super.key,
    required ChewieController? chewieController,
  }) : _chewieController = chewieController;

  final ChewieController? _chewieController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized
              ? Chewie(
                  controller: _chewieController!,
                )
              :           CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class LeftSide extends StatelessWidget {
  const LeftSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 20, bottom: 20),
            width: 536.w,
            height: 147.h,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(75),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(75),
              ),
              image: DecorationImage(
                image: AssetImage("assets/AppBarBackground.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "How to apply",
                    style: TextStyle(
                      fontFamily: "Gotham",
                      fontWeight: FontWeight.w700,
                      fontSize: 35.sp,
                      color: Colors.white,
                    ),
                  ),
                  Image.asset("assets/PlayButtonLarge.png"),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(40),
          width: 460.87.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
            gradient: const RadialGradient(
              radius: 3,
              colors: [
                Color.fromRGBO(165, 239, 255, 0.2),
                Color.fromRGBO(110, 191, 244, 0.04),
                Color.fromRGBO(70, 144, 212, 0),
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.circle,
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        size: 8,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.circle,
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        size: 8,
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.circle,
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                        size: 8,
                      ),
                    ],
                  ),
                  const SizedBox(width: 40),
                  const Text(
                    "Color Gel Polish",
                    style: TextStyle(
                      shadows: [
                        Shadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 3.5),
                        ),
                      ],
                      color: Colors.white,
                      fontFamily: "Gotham",
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Text(
                "Time of polymerization in light of the UV lamp-2-3minutes LED-lamp-1 minute",
                style: TextStyle(
                  fontFamily: "Gotham",
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: Color.fromRGBO(235, 235, 235, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
