import 'package:fittrix_application/core/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _firstVideoController;
  late VideoPlayerController _secondVideoController;

  @override
  void initState() {
    super.initState();
    _firstVideoController =
        VideoPlayerController.asset(AssetsPath.fittrixIntroductionVideo1);
    _secondVideoController =
        VideoPlayerController.asset(AssetsPath.fittrixIntroductionVideo2);
    _firstVideoController.addListener(() {
      setState(() {
        if (!_firstVideoController.value.isPlaying) {
          _secondVideoController.setLooping(false);
          _secondVideoController.initialize();
          _secondVideoController.play();
        }
      });
    });
    _firstVideoController.setLooping(false);
    _firstVideoController.initialize().then((_) => setState(() {}));
    _firstVideoController.play();
  }

  @override
  void dispose() {
    super.dispose();
    _firstVideoController.dispose();
    _secondVideoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: _firstVideoController.value.isPlaying
                  ? AspectRatio(
                      aspectRatio: _firstVideoController.value.aspectRatio,
                      child: VideoPlayer(_firstVideoController),
                    )
                  : _secondVideoController.value.isPlaying
                      ? AspectRatio(
                          aspectRatio: _secondVideoController.value.aspectRatio,
                          child: VideoPlayer(_secondVideoController),
                        )
                      : Container(),
            ),
          ),
        ),
      ),
    );
  }
}
