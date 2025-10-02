import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/colo_extension.dart';
import '../../views_bloc/change_page_bloc/change_page_bloc.dart';

class BottonCircleIndicator extends StatelessWidget {
  const BottonCircleIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePageBloc, ChangePage>(
      builder: (context, state) {
        return SizedBox(
          width: 70,
          height: 70,
          child: CircularProgressIndicator(
            color: TColor.primaryColor1,
            value: (state.index + 1) / 4,
            strokeWidth: 2,
          ),
        );
      },
    );
  }
}
