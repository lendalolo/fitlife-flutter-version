import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../common/colo_extension.dart';
import '../../../../../common/styles.dart';

class MusclesShimmerLoading extends StatelessWidget {
  final Size media;
  const MusclesShimmerLoading({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        height: media.height,
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: media.width * 0.35,
                              width: media.width * 0.35,
                              decoration: BoxDecoration(
                                  color: TColor.lightGray,
                                  borderRadius: BorderRadius.circular(15)),
                              alignment: Alignment.center,
                              child: Container(
                                width: media.width * 0.2,
                                height: media.width * 0.2,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 80,
                                height: 5,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 40,
                                height: 5,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ));
                  }),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 25,
                  child: Text(
                    '1',
                    style: Styles.kFontSize14.copyWith(
                      color: TColor.primaryColor1,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: TColor.primaryColor1,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          border: Border.all(color: TColor.white, width: 3),
                          borderRadius: BorderRadius.circular(9),
                        ),
                      ),
                    ),
                    if (true)
                      const DottedDashedLine(
                          height: 125,
                          width: 0,
                          dashColor: TColor.primaryColor1,
                          axis: Axis.vertical)
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            style: BorderStyle.solid,
                            color: TColor.primaryColor1),
                        borderRadius: BorderRadius.circular(30)),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 50,crossAxisSpacing: 12, mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return TextButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                                side: const BorderSide(
                                  color: TColor.primaryColor1,
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                          child: Text('${index + 1}'),
                        );
                      },
                      itemCount: 7,
                    ),
                  ),
                ),
                //  const SizedBox(height: 15,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
