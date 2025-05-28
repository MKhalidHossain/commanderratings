import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSplashScreen extends StatefulWidget {
  final Widget nextScreen;

  const VideoSplashScreen({required this.nextScreen, super.key});

  @override
  State<VideoSplashScreen> createState() => _VideoSplashScreenState();
}

class _VideoSplashScreenState extends State<VideoSplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/sp.mp4")
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });

    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => widget.nextScreen),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _controller.value.isInitialized
          ? FittedBox(
            child: Container(
              height: size.height,
              width: size.width,
              color: Color(0xff101010),
              child: Column(
                children: [
                   SizedBox(height: size.height * .32,),
                  Container(
                    height: _controller.value.size.height * .3,
                    width: _controller.value.size.width * 1.1,
                    child: Center(child: VideoPlayer(_controller, )),
                  ),
                ],
              ),
            ),
          )
          : Container(color: Colors.black),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'onboarding1.dart';
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//
//   @override
//   void initState() {
//     super.initState();
//     _moveToNextScreen();
//   }
//
//   Future<void> _moveToNextScreen() async {
//     await Future.delayed(
//       const Duration(seconds: 2),
//     );
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const Onboarding1(),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//           children: [
//             Positioned.fill(child: Image.asset('assets/images/Splash Screen.png'), ),
//             // Align(
//             //   alignment: Alignment.center,
//             //   child: ,
//             // )
//           ],
//         )
//
//       // Column(
//       //   children: [
//       //     Image.asset('assets/images/Splash Screen.png'),
//       //   ],
//       // )
//     );
//   }
// }