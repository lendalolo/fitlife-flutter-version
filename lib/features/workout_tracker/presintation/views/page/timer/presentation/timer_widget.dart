// import 'package:circular_countdown_timer/circular_countdown_timer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:timer/common/colo_extension.dart';
// import 'package:timer/common/constant.dart';
// // import 'package:gyms/common/constant/constant.dart';

// timer_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import '../../../../../../../common/colo_extension.dart';
import '../bloc/timer_bloc.dart';


class TimerWidget extends StatefulWidget {
  final int duration;

  const TimerWidget({super.key, required this.duration});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  final CountDownController _controller = CountDownController();
  bool hasStarted = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerBloc, TimerState>(
      listener: (context, state) {
        if (state is TimerRunning) {
          if (!hasStarted) {
            _controller.start();
            hasStarted = true;
          } else {
            _controller.resume();
          }
        } else if (state is TimerPaused) {
          _controller.pause();
        } else if (state is TimerFinished) {
        //  _controller.restart(duration: widget.duration);
          hasStarted = false;
        }
      },
      child: CircularCountDownTimer(
        duration: widget.duration,
        controller: _controller,
        width: 120,
        height: 120,
        ringColor: Colors.grey,
        fillColor: TColor.primaryColor2,
        strokeWidth: 10,
        strokeCap: StrokeCap.round,
        textStyle: const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        isReverse: true,
        isReverseAnimation: true,
        autoStart: false,
        onComplete: () {
          context.read<TimerBloc>().add(CompleteTimer());
          Future.delayed(const Duration(milliseconds: 100), () {
            if (mounted) {
              Navigator.of(context).pop();
            }
          });
          // if (mounted) {
          //   Navigator.of(context).pop();
          // }
        },
      ),
    );
  }
}

// import '../../bloc/timer_bloc.dart';
// import '../../bloc/timer_event.dart';
// import '../../bloc/timer_state.dart';

// class TimerWidget extends StatelessWidget {
//   final int duration;
//   final _controller = CountDownController();

//   TimerWidget({super.key, required this.duration});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<TimerBloc, TimerState>(
//       listener: (context, state) {
//         if (state is TimerRunning) {
//           _controller.restart(duration: duration);
//         }
//         if (state is TimerFinished) {
//           // أي أكشن عند الانتهاء
//         }
//       },
//       child: CircularCountDownTimer(
//         duration: duration,
//         controller: _controller,
//         width: 120,
//         height: 120,
//         ringColor: Colors.grey.shade300,
//         fillColor: TColor.primaryColor2,
//         strokeWidth: 10,
//         strokeCap: StrokeCap.round,
//         textStyle: const TextStyle(
//           fontSize: 28,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//         isReverse: true,
//         isReverseAnimation: true,
//         autoStart: false,
//         onComplete: () {
//           context.read<TimerBloc>().add(CompleteTimer());
//         },
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:timer/common/colo_extension.dart';
// import 'package:timer/page/timer/bloc/timer_bloc.dart';
// import 'package:timer/page/timer/bloc/timer_event.dart';
// import 'package:timer/page/timer/bloc/timer_state.dart';

// class TimerWidget extends StatelessWidget {
//   final int duration;
//   final _controller = CountDownController();

//   TimerWidget({super.key, required this.duration});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<TimerBloc, TimerState>(
//       listener: (context, state) {
//         if (state is TimerRunning) {
//           _controller.resume();
//         } else if (state is TimerPaused) {
//           _controller.pause();
//         } else if (state is TimerInitial) {
//           _controller.restart(duration: duration);
//         } else if (state is TimerFinished) {
//           _controller.pause();
//         }
//       },
//       child: CircularCountDownTimer(
//         duration: duration,
//         controller: _controller,
//         width: 120,
//         height: 120,
//         ringColor: Colors.grey.shade300,
//         fillColor: TColor.primaryColor2,
//         strokeWidth: 10,
//         strokeCap: StrokeCap.round,
//         textStyle: const TextStyle(
//           fontSize: 28,
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//         ),
//         isReverse: true,
//         isReverseAnimation: true,
//         autoStart: false,
//         onComplete: () {
//           context.read<TimerBloc>().add(CompleteTimer());
//         },
//       ),
//     );
//   }
// }
