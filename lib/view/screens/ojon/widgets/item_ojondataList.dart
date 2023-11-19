
import 'package:flutter/material.dart';
import 'package:my_hospital_app/controller/utils/util.custom_text.dart';

class OjonDataListItem extends StatelessWidget {
  final String week;
  final String ojon;
  const OjonDataListItem({Key? key, required this.week, required this.ojon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: week,
                  fontcolor: Colors.black,
                  fontsize: 14,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: ojon,
                  fontcolor: Colors.black,
                  fontsize: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
