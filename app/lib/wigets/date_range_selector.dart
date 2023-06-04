import 'package:flutter/material.dart';

enum DateRange {
  Today,
  ThisWeek,
  ThisMonth,
  ThisYear,
  Custom,
}

class DateRangeSelector extends StatefulWidget {
  const DateRangeSelector({Key? key}) : super(key: key);

  @override
  _DateRangeSelectorState createState() => _DateRangeSelectorState();
}

class _DateRangeSelectorState extends State<DateRangeSelector> {
  DateRange selectedDateRange = DateRange.Today;
  DateTime? startDate;
  DateTime? endDate;

  void handleDateRangeChange(DateRange? value) {
    setState(() {
      selectedDateRange = value!;
    });

    if (value != DateRange.Custom) {
      // Reset start and end dates when a pre-defined range is selected
      setState(() {
        startDate = null;
        endDate = null;
      });
    }
  }

  void showDatePicker2(BuildContext context, bool isStartDate) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (selectedDate != null) {
      setState(() {
        if (isStartDate) {
          startDate = selectedDate;
        } else {
          endDate = selectedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Período', style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
            ),
            DropdownButton<DateRange>(
              value: selectedDateRange,
              onChanged: handleDateRangeChange,
              items: [
                DropdownMenuItem(
                  value: DateRange.Today,
                  child: Text('Hoje'),
                ),
                DropdownMenuItem(
                  value: DateRange.ThisWeek,
                  child: Text('Esta Semana'),
                ),
                DropdownMenuItem(
                  value: DateRange.ThisMonth,
                  child: Text('Este Mês'),
                ),
                DropdownMenuItem(
                  value: DateRange.ThisYear,
                  child: Text('Este Ano'),
                ),
                DropdownMenuItem(
                  value: DateRange.Custom,
                  child: Text('Personalizado'),
                ),
              ],
            )
          ],
        ),
        if (selectedDateRange == DateRange.Custom) ...[
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => showDatePicker2(context, true),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text('Início'),
                      Text(startDate != null ? startDate!.toString() : 'Selecionar',
                          style: TextStyle(color:Colors.grey)
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => showDatePicker2(context, false),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Fim', textAlign: TextAlign.start),
                      Text(endDate != null ? endDate!.toString() : 'Selecionar',
                          style: TextStyle(color:Colors.grey)
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15)
        ],
      ],
    );
  }
}
