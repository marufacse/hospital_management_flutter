
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalenderPart extends StatefulWidget {
  final Function callback;
  const CalenderPart({Key? key, required this.callback}) : super(key: key);

  @override
  State<CalenderPart> createState() => _CalenderPartState();
}

class _CalenderPartState extends State<CalenderPart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black26, offset: Offset(1, 1), blurRadius: 1)
      ]),
      child: SfCalendar(
        view: CalendarView.month,
        onTap: (CalendarTapDetails details) {
          DateTime date = details.date!;
          // String  selectedDate = date.toString().substring(0, 10);
          /* print("Datetime now: ${DateTime.now()}");
          print("Selected date: ${date}"); */
          String selectedDate =DateFormat("yMMMMd").format(date);
          // String selectedDate = DateFormat('yMMMMD').format(date);
          widget.callback(selectedDate);
          // print(currentDate.toString().substring(0, 10));
        },
      ),
    );
  }
}
