import 'package:flutter/material.dart';

import '../common/colo_extension.dart';

class GradiantText extends StatelessWidget {
  final String title;
  final TextStyle? textStyle;
  final LinearGradient? linearGradiant;
  const GradiantText({super.key, required this.title, this.textStyle, this.linearGradiant =TColor.kmainGradint});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return linearGradiant
            !.createShader(Rect.fromLTRB(0, 0, bounds.width, bounds.height));
      },
      child: Text(title,
          style: textStyle),
    );
  }
}
