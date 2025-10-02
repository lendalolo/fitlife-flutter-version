import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../common/colo_extension.dart';
import '../../../views blocs/policy bloc/policy_bloc.dart';
class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key, required this.state,
  });
  final CheckPolicyState state;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<PolicyBloc>(context).add(CheckPolicy(
            state.isPressed == true ? true : false));
      },
      icon: Icon(
        state.isPressed
            ? Icons.check_box_outlined
            : Icons.check_box_outline_blank_outlined,
        color: TColor.gray,
        size: 20,
      ),
    );
  }
}