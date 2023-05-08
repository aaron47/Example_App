import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:essential_beauty/screens/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'screens/splash.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => const MyApp(), // Wrap your app
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Essential Beauty',
          useInheritedMediaQuery: true,
          builder: DevicePreview.appBuilder,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: child,
        );
      },
      child: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(1920, 1080));
    return AnimatedSplashScreen(
      splashIconSize: MediaQuery.of(context).size.height,
      splash: const Splash(),
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
      duration: 1500,
    );
  }
}
