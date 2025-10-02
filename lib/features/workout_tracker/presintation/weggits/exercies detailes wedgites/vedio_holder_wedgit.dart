
import 'package:flutter/material.dart';

import '../../../../../common/api_servieses.dart';
import '../../../../../common/colo_extension.dart';
import '../../../data/models/exercies_detailes_models.dart';
import 'package:video_player/video_player.dart';
class VedioHolderWidget extends StatefulWidget {
  const VedioHolderWidget({
    super.key,
    required this.media,
    required this.widget,
  });

  final Size media;
  final ExerciesDetailes widget;

  @override
  State<VedioHolderWidget> createState() => _VedioHolderWidgetState();
}

class _VedioHolderWidgetState extends State<VedioHolderWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    if (widget.widget.VedioUrl.isNotEmpty) {
      final videoUrl = widget.widget.VedioUrl;
      print('$videoUrl llololololololoool');
      _controller = VideoPlayerController.networkUrl(
        Uri.parse("$imageBaseUrl${videoUrl.split('8000/').last}"),
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      )
        ..addListener(() {
          setState(() {});
        })
        ..setLooping(true)
        ..initialize().then((_) {
          setState(() {});
        });
      print('"$imageBaseUrl${videoUrl.split('8000/').last}" llololololololoool');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    bool hasVideo = widget.widget.VedioUrl.isNotEmpty ;

    return Container(
      width: widget.media.width,
      height: widget.media.width * 0.43,
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: TColor.primaryG),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: hasVideo
            ? AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              VideoPlayer(_controller),
              if (_controller.value.caption.text.isNotEmpty)
                ClosedCaption(text: _controller.value.caption.text),
              ControlsOverlay(controller: _controller),
              VideoProgressIndicator(_controller, allowScrubbing: true),
            ],
          ),
        )
            : const Center(
          child: Icon(
            Icons.videocam_off,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }

}

class ControlsOverlay extends StatelessWidget {
  const ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : const ColoredBox(
            color: Colors.black26,
            child: Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}