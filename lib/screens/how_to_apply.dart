import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../shared/tablet_detector.dart';
import '../widgets/nails/custom_app_bar.dart';

class HowToApplyScreen extends StatefulWidget {
  const HowToApplyScreen({super.key});

  @override
  State<HowToApplyScreen> createState() => _HowToApplyScreenState();
}

class _HowToApplyScreenState extends State<HowToApplyScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  final isTablet = TabletDetector.isTablet(
      MediaQueryData.fromWindow(WidgetsBinding.instance.window));

  @override
  void initState() {
    super.initState();

    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController =
        VideoPlayerController.asset("assets/nail_video.mp4")
          ..initialize().then((_) => setState(() {}));
    _createChewieController();
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      materialProgressColors: ChewieProgressColors(
        backgroundColor: Colors.white,
        playedColor: Color.fromRGBO(26, 127, 134, 100),
        bufferedColor: Color.fromRGBO(26, 127, 134, 20),
      ),
    );
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
      appBar: const CustomAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: RadialGradient(
          center: Alignment(0.0393, 1.0),
          radius: 4.1932,
          colors: [
            Color.fromRGBO(20, 77, 81, 0.8),
            Color.fromRGBO(0, 0, 0, 0.8),
          ],
        )),
        child: Row(
          children: [
            if (isTablet) ...[
              const LeftSide(),
              RightSide(chewieController: _chewieController)
            ] else ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LeftSidePhone(),
                  const SizedBox(height: 20),
                  RightSidePhone(chewieController: _chewieController),
                ],
              )
            ]
          ],
        ),
      ),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset("assets/CloseButton.png",
                      width: 66.21.w, height: 66.h),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 40.w),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!,
                    )
                  : const CircularProgressIndicator(
                      backgroundColor: Color.fromRGBO(20, 77, 81, 0.8),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class RightSidePhone extends StatelessWidget {
  const RightSidePhone({
    super.key,
    required ChewieController? chewieController,
  }) : _chewieController = chewieController;

  final ChewieController? _chewieController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "NAILS POLISH",
            style: TextStyle(
              fontFamily: "Gotham",
              fontWeight: FontWeight.w700,
              fontSize: 25,
              color: Color.fromRGBO(248, 248, 248, 1),
            ),
          ),
          SizedBox(
            width: 305.85,
            height: 197.76,
            child: Center(
              child: _chewieController != null &&
                      _chewieController!
                          .videoPlayerController.value.isInitialized
                  ? Stack(children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Image.asset("assets/CloseButton.png",
                              width: 21.82, height: 21.75),
                        ),
                      ),
                      Chewie(
                        controller: _chewieController!,
                      ),
                    ])
                  : const CircularProgressIndicator(
                      backgroundColor: Color.fromRGBO(20, 77, 81, 0.8),
                    ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            padding: const EdgeInsets.all(15),
            width: 300,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        fontSize: 15,
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
                    fontSize: 12,
                    color: const Color.fromRGBO(235, 235, 235, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
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
          child: Hero(
            tag: "HowToApply",
            child: Container(
              margin: EdgeInsets.only(top: 20.h, bottom: 20),
              width: 636.w,
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
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(40),
          width: 560.87.w,
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    "Color Gel Polish",
                    style: TextStyle(
                      shadows: const [
                        Shadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 3.5),
                        ),
                      ],
                      color: Colors.white,
                      fontFamily: "Gotham",
                      fontSize: 28.w,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Text(
                "Time of polymerization in light of the UV lamp-2-3minutes LED-lamp-1 minute",
                style: TextStyle(
                  fontFamily: "Gotham",
                  fontWeight: FontWeight.w400,
                  fontSize: 28.w,
                  color: const Color.fromRGBO(235, 235, 235, 1),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LeftSidePhone extends StatelessWidget {
  const LeftSidePhone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Hero(
            tag: "HowToApply",
            child: Container(
              margin: EdgeInsets.only(top: 20.h, bottom: 20),
              width: 218,
              height: 69,
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
                    const Text(
                      "How to apply",
                      style: TextStyle(
                        fontFamily: "Gotham",
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      "assets/PlayButtonLarge.png",
                      width: 30.59,
                      height: 30.59,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
