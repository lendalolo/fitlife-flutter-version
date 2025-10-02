import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppInkWell extends StatelessWidget {
  const AppInkWell({
    super.key,
    this.child,
    required this.onTap,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onSecondaryTap,
    this.onSecondaryTapUp,
    this.onSecondaryTapDown,
    this.onSecondaryTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.mouseCursor,
    this.highlightShape = BoxShape.circle,
    this.radius,
    this.borderRadius,
    this.customBorder,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.overlayColor,
    this.splashColor,
    this.splashFactory,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.focusNode,
    this.canRequestFocus = true,
    this.onFocusChange,
    this.autofocus = false,
    this.statesController,
    this.hoverDuration,
  });

  final Widget? child;
  final GestureTapCallback? onTap;
  final GestureTapDownCallback? onTapDown;
  final GestureTapUpCallback? onTapUp;
  final GestureTapCallback? onTapCancel;
  final GestureTapCallback? onDoubleTap;
  final GestureLongPressCallback? onLongPress;
  final GestureTapCallback? onSecondaryTap;
  final GestureTapDownCallback? onSecondaryTapDown;
  final GestureTapUpCallback? onSecondaryTapUp;
  final GestureTapCallback? onSecondaryTapCancel;
  final ValueChanged<bool>? onHighlightChanged;
  final ValueChanged<bool>? onHover;
  final MouseCursor? mouseCursor;
  final BoxShape highlightShape;
  final double? radius;
  final BorderRadius? borderRadius;
  final ShapeBorder? customBorder;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final bool enableFeedback;
  final bool excludeFromSemantics;
  final ValueChanged<bool>? onFocusChange;
  final bool autofocus;
  final FocusNode? focusNode;
  final bool canRequestFocus;
  final MaterialStatesController? statesController;
  final Duration? hoverDuration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap,
      highlightColor:highlightColor ??Colors.transparent,
      splashColor:splashColor ?? Colors.transparent,
      radius:radius,
      excludeFromSemantics:excludeFromSemantics,
      canRequestFocus:canRequestFocus,
      autofocus:autofocus,
      focusNode:focusNode,
      borderRadius:borderRadius,
      customBorder:customBorder,
      enableFeedback:enableFeedback,
      focusColor:focusColor,
      hoverColor:hoverColor,
      hoverDuration:hoverDuration,
      key:key,
      mouseCursor:mouseCursor,
      onDoubleTap:onDoubleTap,
      onFocusChange: onFocusChange,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      onLongPress: onLongPress,
      onSecondaryTap: onSecondaryTap,
      onSecondaryTapCancel: onSecondaryTapCancel,
      onSecondaryTapDown:onSecondaryTapDown ,
      onSecondaryTapUp:onSecondaryTapUp ,
      onTapCancel: onTapCancel,
      onTapDown: onTapDown,
      onTapUp:onTapUp ,
      overlayColor: overlayColor,
      splashFactory:splashFactory ,
      statesController: statesController,
      child:child,
    );
  }
}
