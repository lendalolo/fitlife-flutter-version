import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/colo_extension.dart';
import '../wedgits/popular_meal_row.dart';

class NewRecipesWedgitShimmerLoading extends StatelessWidget {
  const NewRecipesWedgitShimmerLoading({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: TColor.primaryColor2.withOpacity(0.4),
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child:  ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: TColor.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
                  child: Row(
                    children: [
                      SizedBox(

                        width: 50,
                        height: 50,

                      ),
                      const SizedBox(
                        width: 15,
                      ),

                      IconButton(
                        onPressed: () {
                        },
                        icon: Image.asset(
                          "assets/img/next_icon.png",
                          width: 25,
                          height: 25,
                        ),
                      )
                    ],
                  ));
            }),
      ),
    );

  }
}