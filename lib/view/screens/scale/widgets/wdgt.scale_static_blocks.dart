import 'package:flutter/material.dart';
import 'package:my_hospital_app/controller/utils/util.custom_text.dart';
import 'package:my_hospital_app/controller/utils/util.my_scr_size.dart';
import 'package:my_hospital_app/model/consts/const.colors.dart';
import 'package:my_hospital_app/model/consts/const.data.bn.dart';
import 'package:my_hospital_app/view/screens/shagotom/widgets/wdgt.timestar_block.dart';





class ScaleStaticBlocks extends StatelessWidget {
  final List<Color> timestarColorList;
  const ScaleStaticBlocks({Key? key, required this.timestarColorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 45,
                  itemBuilder: ((context, index) {
                    return TimestarBlock(
                      // color: widget.timestarColorList[index],
                      color: index > 39
                          ? timestarColorList[38]
                          : timestarColorList[index],
                      width: MyScreenSize.mGetWidth(
                        context,
                        1.85,
                      ),
                    );
                  })),
              SizedBox(
                width: MyScreenSize.mGetWidth(context, 96),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: const CustomText(
                          text: MaaData.first_timestar,
                          fontcolor: MyColors.textOnPrimary,
                          fontsize: 14.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: const CustomText(
                          text: MaaData.second_timestar,
                          fontcolor: MyColors.textOnPrimary,
                          fontsize: 14.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.center,
                        child: const CustomText(
                          text: MaaData.third_timestar,
                          fontcolor: MyColors.textOnPrimary,
                          fontsize: 14.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
