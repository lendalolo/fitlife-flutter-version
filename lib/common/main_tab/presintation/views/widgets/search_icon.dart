import 'package:fitness/common/utls/name_class.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../colo_extension.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       // GoRouter.of(context).pushNamed(  Names.ExercisCounter     );
                   },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: TColor.primaryG,
            ),
            borderRadius: BorderRadius.circular(35),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 2,
              )
            ]),
        child: SizedBox(
            width: 15, height: 15,
          child: Image.asset("assets/img/app.png",
              width: 15, height: 15, fit: BoxFit.fitHeight),
        )
        // Icon(
        //   Icons.search,
        //   color: TColor.white,
        //   size: 35,
        // ),
      ),
    );
  }
}