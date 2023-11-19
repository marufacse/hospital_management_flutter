import 'package:flutter/material.dart';
import 'package:my_hospital_app/controller/utils/util.custom_text.dart';
import 'package:my_hospital_app/controller/utils/util.my_scr_size.dart';
import 'package:my_hospital_app/model/consts/const.colors.dart';
import 'package:my_hospital_app/model/consts/const.data.bn.dart';
import 'package:my_hospital_app/view/screens/pragnency/shagotom/widgets/wdgt.timestar_block.dart';

class ScaleSurvive extends StatelessWidget {
  const ScaleSurvive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //vABC
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Row(
                  children: [
                    ListView.builder(
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return TimestarBlock(
                            margin: 0,
                            width: MyScreenSize.mGetWidth(
                                context, MaaData.sWidthlist[index]),
                            color: MyColors.abc[index],
                            text: MaaData.sLetterlist[index],
                            fontColor: MyColors.textOnPrimary,
                            textRotate: false,
                            contentAlignment: Alignment.center,
                          );
                        })
                  ],
                ),
              ),
            ),

            //v50% Survival Posibility
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        ListView.builder(
                            itemCount: 10,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return TimestarBlock(
                                width: MyScreenSize.mGetWidth(
                                    context, MaaData.s2Widthlist[index]),
                                color: MyColors.redGreenPlates[index],
                                margin: 0,
                                textRotate: false,
                              );
                            }),
                        const CustomText(
                          text: MaaData.survival_posibilty,
                          fontcolor: MyColors.textOnPrimary,
                          fontsize: 16,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
