import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  TimePickerWidget({required this.changeTime, required this.selectedTime});

  final TimeOfDay selectedTime;
  final Function changeTime;

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          final TimeOfDay? picked = await showTimePicker(
            context: context,
            initialTime: widget.selectedTime,
            initialEntryMode: TimePickerEntryMode.input,
            helpText: 'Chọn thời gian', // Can be used as title
            cancelText: 'Hủy bỏ',
            confirmText: 'Xác nhận',
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme:
                      ColorScheme.light(primary: const Color(0xFF39B54A)),
                ),
                child: child as Widget,
              );
            },
          );

          if (picked != null && picked != widget.selectedTime)
            widget.changeTime(picked);
        },
        child: Container(
          width: (MediaQuery.of(context).size.width - 48) / 2,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xFFF1F1F1)),
              borderRadius: BorderRadius.circular(6)),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  '${widget.selectedTime.hour > 10 ? widget.selectedTime.hour : "0" + widget.selectedTime.hour.toString()}:${widget.selectedTime.minute >= 10 ? widget.selectedTime.minute : "0" + widget.selectedTime.minute.toString()}:00',
                  style: TextStyle(
                      color: Color(0xFF595959), fontWeight: FontWeight.w500)),
              Icon(
                Icons.access_alarm_rounded,
                color: Color(0xFF39B54A),
                size: 24,
              )
            ],
          )),
        ));
  }
}
