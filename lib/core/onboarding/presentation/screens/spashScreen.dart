import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        setState(() {}); // Ensure the widget rebuilds when initialized
        _controller.play();

        // Wait for video duration + 6 seconds before navigating
        Future.delayed(_controller.value.duration + const Duration(seconds: 2), () {
          Get.offAll(widget.nextScreen);
        });
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
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? FittedBox(
        child: Container(
          width: size.width,
          height: size.height,
          color: Color(0xff101010),
          child: Column(
            children: [
              SizedBox(height: size.height * .32,),
              Container(
                width: _controller.value.size.width *.3,
                height: _controller.value.size.height *0.25,
                child: VideoPlayer(_controller),
              ),
            ],
          ),
        ),
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
