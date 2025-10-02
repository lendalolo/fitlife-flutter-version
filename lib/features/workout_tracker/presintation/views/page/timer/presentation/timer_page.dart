

import 'package:fitness/common_widget/custtom_app_image_with_gradient_backgroung.dart';
import 'package:fitness/common_widget/custtom_app_title.dart';
import 'package:fitness/features/workout_tracker/presintation/views/page/timer/presentation/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../../common/api_servieses.dart';
import '../../../../../../../common/colo_extension.dart';
import '../../../../../../../common/common blocs/languge blocs/languge_bloc.dart';
import '../../../../../../../common_widget/custtom_read_more_descriptons.dart';
import '../../../../../../food/presintation/veiwes/wedgits/app_bar_for_app_bar_property.dart';
import '../../../../../data/models/exercies_detailes_models.dart';
import '../../../../weggits/exercies detailes wedgites/vedio_holder_wedgit.dart';
import '../../../common/constant.dart';
import '../bloc/timer_bloc.dart';



class TimerPage extends StatefulWidget {
  final ExerciesDetailes exerciesDetailes;
  const TimerPage({super.key, required this.exerciesDetailes});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  late VideoPlayerController _controller;
  late String title;
  late String description;
  @override
  void initState() {
    super.initState();
    context.read<LangugeBloc>().state.locale ==Locale('ar')?
    title =widget.exerciesDetailes.titleAr!:title =widget.exerciesDetailes.title!;
    context.read<LangugeBloc>().state.locale ==Locale('ar')?
    description =widget.exerciesDetailes.descriptionAr!:description =widget.exerciesDetailes.description!;
    if (widget.exerciesDetailes.SvgUrl.isNotEmpty) {
      final videoUrl = widget.exerciesDetailes.SvgUrl;
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
    bool hasVideo = widget.exerciesDetailes.VedioUrl.isNotEmpty ;
    return BlocProvider(
      create: (_) => TimerBloc(),
      child: Scaffold(
        appBar: CusttomAppBarForAppBarProberty(
            context: context, title: title),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child:  Container(
                    width: MediaQuery.of(context).size.width,
                    height:  MediaQuery.of(context).size.width * 0.43,
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
                  ),
                  // Center(
                  //   child: CusttomAppImageWithGradentBackground(index: 0,
                  //       image:  widget.exerciesDetailes.media!.isEmpty?'':
                  //       '$imageBaseUrl${widget.exerciesDetailes.SvgUrl.split('8000/').last}'),
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CusttomReadMorDescription(test: description,),
                )
              ,
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      BlocBuilder<TimerBloc, TimerState>(
                        builder: (context, state) {
                          IconData buttonIcon = Icons.play_arrow;
                          if (state is TimerRunning) {
                            buttonIcon = Icons.pause;
                          } else if (state is TimerPaused) {
                            buttonIcon = Icons.play_arrow;
                          } else if (state is TimerFinished) {
                            buttonIcon = Icons.check;
                          }
            
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: TimerWidget(duration: widget.exerciesDetailes.duration!),
                              ),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                onPressed: () {
                                  final bloc = context.read<TimerBloc>();
                                  if (state is TimerInitial) {
                                    bloc.add(StartTimer(widget.exerciesDetailes.duration!));
                                  } else if (state is TimerRunning) {
                                    bloc.add(PauseTimer());
                                  } else if (state is TimerPaused) {
                                    bloc.add(ResumeTimer());
                                  } else if (state is TimerFinished) {
                                    bloc.add(PauseTimer());
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: TColor.primaryColor2,
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(20),
                                ),
                                child: Icon(
                                  buttonIcon,
                                  color: Colors.black,
                                  size: 30,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
