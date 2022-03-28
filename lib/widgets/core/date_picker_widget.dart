import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({required this.changeDate, required this.selectedDate});

  final DateTime selectedDate;
  final Function changeDate;

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: widget.selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2025),
            initialEntryMode: DatePickerEntryMode.input,
            helpText: 'Chọn ngày', // Can be used as title
            cancelText: 'Hủy bỏ',
            confirmText: 'Xác nhận',
            fieldLabelText: 'Ngày thực hiện',
            fieldHintText: 'Tháng/Ngày/Năm',
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
          if (picked != null && picked != widget.selectedDate)
            widget.changeDate(picked);
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
                  '${widget.selectedDate.day}/${widget.selectedDate.month}/${widget.selectedDate.year}',
                  style: TextStyle(
                      color: Color(0xFF595959), fontWeight: FontWeight.w500)),
              Icon(
                Icons.calendar_today_outlined,
                color: Color(0xFF39B54A),
                size: 24,
              )
            ],
          )),
        ));
  }
}
