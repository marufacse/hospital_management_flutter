
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_hospital_app/controller/services/service.my_service.dart';
import 'package:my_hospital_app/controller/utils/util.custom_text.dart';
import 'package:my_hospital_app/controller/utils/util.my_scr_size.dart';
import 'package:my_hospital_app/model/consts/const.colors.dart';
import 'package:my_hospital_app/model/consts/const.data.bn.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shared_preferences/shared_preferences.dart';


class InputOjonDialog extends StatefulWidget {
  final Function callback;
  int currentRoundValue;
  int currentFrucValueAsInt;
  final int runningWeeks;
  // final SharedPreferences sharedPreferences;
  InputOjonDialog(
      {Key? key,
      required this.callback,
      required this.currentRoundValue,
      required this.currentFrucValueAsInt,
      required this.runningWeeks})
      : super(key: key);

  @override
  State<InputOjonDialog> createState() => _InputOjonDialogState();
}

class _InputOjonDialogState extends State<InputOjonDialog> {
/*   late double _priWeight;
  late int _actualWeeks = 0;
  late int _runningWeeks = 0;
  late int _currentRoundValue = 0;
  late int _currentFrucValueAsInt = 0; */

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    /*  MyServices.mGetSharedPrefIns().then((value) {
      setState(() {
        sharedPreferences = value;
        _priWeight = sharedPreferences.getDouble(MyKeywords.primaryWeight)!;
        _actualWeeks = sharedPreferences.getInt(MyKeywords.runningWeeks)!;
        _runningWeeks = _actualWeeks + 1;

        _currentRoundValue = _priWeight
            .floor(); //set current weight's value before decimal point
        MyServices.mSetFrucValueAsInt(
            priWeight: _priWeight,
            callback: (int value) {
              _currentFrucValueAsInt = value;
              print(_currentFrucValueAsInt);
            });
      });
    }); */
    //set current weight's value after decimal point
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // insetPadding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //heading
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            color: MyColors.pink2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CustomText(
                  text: 'আপনার ওজন দিন',
                  fontWeight: FontWeight.w600,
                  fontcolor: MyColors.textOnPrimary,
                  fontsize: 18,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          //body
          //week no
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(text: MaaData.weekNo),
              //get week no from sharedpref and convert it into Bangla font
              CustomText(
                  text: MyServices.mGenerateBangNum(widget.runningWeeks))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          //Weight picker
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                height: MyScreenSize.mGetHeight(context, 26),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //weight's round value picking..
                    NumberPicker(
                        itemWidth: 60,
                        minValue: 0,
                        maxValue: 150,
                        infiniteLoop: true,
                        value: widget
                            .currentRoundValue, //set round value from previous weight
                        onChanged: (value) => setState(() {
                              widget.currentRoundValue = value;
                            })),

                    const CustomText(
                      text: '.',
                      fontWeight: FontWeight.bold,
                      fontsize: 16,
                      fontcolor: Colors.purple,
                    ),

                    //weight's fructional value picking..
                    NumberPicker(
                        itemWidth: 60,
                        minValue: 0,
                        maxValue: 9,
                        infiniteLoop: true,
                        value: widget.currentFrucValueAsInt,
                        onChanged: (value) => setState(() {
                              widget.currentFrucValueAsInt = value;
                            }))
                  ],
                ),
              )
            ],
          ),
          //Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'বাতিল',
                    fontcolor: MyColors.pink3,
                    fontsize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              InkWell(
                onTap: () {
                  double updatedWeight = double.parse(
                      widget.currentRoundValue.toString() +
                          "." +
                          widget.currentFrucValueAsInt.toString());

                  //arekta call back lagbe
                  widget.callback(updatedWeight);
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'সংরক্ষণ',
                    fontcolor: MyColors.pink3,
                    fontsize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                width: 24,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
