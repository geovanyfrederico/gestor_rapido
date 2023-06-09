import 'package:flutter/material.dart';
import 'package:gr/core/utils/tempo.dart';

enum DateRange {
  Today,
  ThisWeek,
  ThisMonth,
  ThisYear,
  Custom,
}

class DateRangeSelector extends StatefulWidget {
  const DateRangeSelector({Key? key, this.callback}) : super(key: key);
  final Function(DateTime?  inicio, DateTime?  fim)? callback;

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
    DateTimeRange dateTimeRange;


    if(value == DateRange.Today){
      dateTimeRange = Tempo.today();
      startDate = dateTimeRange.start;
      endDate = dateTimeRange.end;
    }

    if(value == DateRange.ThisWeek){
      dateTimeRange = Tempo.thisWeek();
      startDate = dateTimeRange.start;
      endDate = dateTimeRange.end;
    }

    if(value == DateRange.ThisMonth){
      dateTimeRange = Tempo.thisMonth();
      startDate = dateTimeRange.start;
      endDate = dateTimeRange.end;
    }

    if(value == DateRange.ThisYear){
      dateTimeRange = Tempo.thisYear();
      startDate = dateTimeRange.start;
      endDate = dateTimeRange.end;
    }

    if(value == DateRange.Custom){
      // Reset start and end dates when a pre-defined range is selected
      setState(() {
        startDate =  Tempo.today().start;
        endDate =  Tempo.today().start;
      });
    }

    widget.callback?.call(startDate, endDate);

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
      widget.callback?.call(startDate, endDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal:15),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal:0),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Período', style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal
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
                )
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

        )
    );

  }
}
