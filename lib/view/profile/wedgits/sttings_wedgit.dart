import 'dart:async';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

import '../../../common/colo_extension.dart';
import '../../../common/styles.dart';
class SttingsWedgit extends StatefulWidget {
  final String title;
  final String subTitle;
  final IconData imageName;
  bool positive;
  FutureOr<void> Function(bool)? onChanged;
  SttingsWedgit({super.key,  this.positive= false, required this.title, required this.subTitle, required this.imageName,this.onChanged});

  @override
  State<SttingsWedgit> createState() => _SttingsWedgitState();
}

class _SttingsWedgitState extends State<SttingsWedgit> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
          color: TColor.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 2)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              color: TColor.black,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            height: 30,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(widget.imageName, size: 20,color: TColor.primaryColor1,),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      widget.subTitle,
                      style: Styles.kFontSize12.copyWith(color: TColor.black),
                    ),
                  ),
                  CustomAnimatedToggleSwitch<bool>(
                    current: widget.positive,
                    values: [false, true],
                    //dif: 0.0,
                    indicatorSize: Size.square(30.0),
                    animationDuration:
                    const Duration(milliseconds: 200),
                    animationCurve: Curves.linear,
                    onChanged:widget.onChanged,
                    //onChanged: (b) => setState(() => widget.positive = b),
                    iconBuilder: (context, local, global) {
                      return const SizedBox();
                    },
                    // defaultCursor: SystemMouseCursors.click,
                    // onTap: () => setState(() => positive = !positive),
                    iconsTappable: false,
                    wrapperBuilder: (context, global, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                              left: 10.0,
                              right: 10.0,
                              height: 30.0,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: TColor.secondaryG),
                                  borderRadius:
                                  const BorderRadius.all(
                                      Radius.circular(50.0)),
                                ),
                              )),
                          child,
                        ],
                      );
                    },
                    foregroundIndicatorBuilder: (context, global) {
                      return SizedBox.fromSize(
                        size: const Size(10, 10),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: TColor.white,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(50.0)),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black38,
                                  spreadRadius: 0.05,
                                  blurRadius: 1.1,
                                  offset: Offset(0.0, 0.8))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ]),
          ),

        ],
      ),
    );
  }
}