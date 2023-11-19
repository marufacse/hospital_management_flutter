import 'package:flutter/material.dart';
import 'package:my_hospital_app/controller/utils/util.custom_text.dart';
import 'package:my_hospital_app/controller/utils/util.date_format.dart';
import 'package:my_hospital_app/controller/utils/util.my_scr_size.dart';
import 'package:my_hospital_app/model/consts/const.colors.dart';
import 'package:my_hospital_app/model/consts/const.data.bn.dart';
import 'package:my_hospital_app/model/consts/const.keywords.dart';
import 'package:shared_preferences/shared_preferences.dart';



class SlideTile2 extends StatefulWidget {
  const SlideTile2({Key? key}) : super(key: key);

  @override
  State<SlideTile2> createState() => _SlideTile2State();
}

class _SlideTile2State extends State<SlideTile2> {
  late DateTime endDate;
  late String endDateStr;

  @override
  void initState() {
    super.initState();

    endDateStr = "";
    loadEndDate();
    // calculateEndDate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CustomText(
            text: MaaData.dateChange,
            fontcolor: MyColors.textOnPrimary,
            fontsize: 20,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 14,
          ),
          InkWell(
            // onTap: (){},
            onTap: () {
              _mSelectDate(context);
            },
            child: Image.asset(
              "lib/assets/images/ic_action_calendar_month_intro.png",
              fit: BoxFit.fill,
              height: MyScreenSize.mGetHeight(context, 14),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const Divider(
            height: 1,
            thickness: 2,
            color: MyColors.textOnPrimary,
          ),
          const SizedBox(
            height: 12,
          ),
          const CustomText(
            text: MaaData.slide_3_title,
            fontcolor: MyColors.textOnPrimary,
            fontsize: 28,
            fontWeight: FontWeight.w600,
          ),
          const SizedBox(
            height: 18,
          ),
          CustomText(
            text: endDateStr,
            fontcolor: MyColors.textOnPrimary,
            fontWeight: FontWeight.w400,
            fontsize: 24,
          )
        ],
      ),
    );
  }

  _mSelectDate(BuildContext context) {
    DateTime? selectDate = endDate;
    showDatePicker(
            context: context,
            initialDate: selectDate,
            firstDate: DateTime(selectDate.year - 1),
            // firstDate: DateTime(DateTime.now().year + 1),
            lastDate: selectDate.add(const Duration(days: 30)))
        .then((value) {
      setState(() {
        selectDate = value;
        if (selectDate != null && selectDate != endDate) {
          endDate = selectDate!;
          setDate(endDate.toString());
          endDateStr = CustomDateForamt.mFormateDate(endDate);
        }
      });
    });
  }

  void setDate(String d) async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    setState(() {
      _pref.setString(MyKeywords.enddate, d);
    });
  }

  Future<DateTime> calculateEndDate() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    setState(() {
      String sDate =
          _pref.getString(MyKeywords.startdate) ?? DateTime.now().toString();
      endDate = DateTime.parse(sDate).add(const Duration(days: 280));
      setDate(endDate.toString());
      endDateStr = CustomDateForamt.mFormateDate(endDate);
    });
    return endDate;
  }

  void loadEndDate() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    calculateEndDate().then(
      (value) {
        setState(() {
          String d = _pref.getString(MyKeywords.enddate) ?? value.toString();
          // calculateEndDate().toString();
          endDate = DateTime.parse(d);
          setDate(endDate.toString());
          endDateStr = CustomDateForamt.mFormateDate(endDate);
        });
      },
    );
  }
}
