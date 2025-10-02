
import'package:flutter/material.dart';

void animateTo( AnimationController _controller, Animation<int> _animation, CurvedAnimation _curvedAnimation,int value) {
  int old = _animation.value;
  _controller.reset();
  _animation = IntTween(begin: old, end: value).animate(
    _curvedAnimation,
  );
  _controller.forward();
}
