import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Tempo {

  static String formatarData(String dataString) {
    DateFormat formatoEntrada = DateFormat("yyyy-MM-dd");
    DateFormat formatoSaida = DateFormat("dd/MM/yyyy");
    DateTime data = formatoEntrada.parse(dataString);
    return formatoSaida.format(data);
  }
  static String formatarDataNull(String? dataString)
  {

    dataString ??= DateTime.now().toIso8601String();
    DateFormat formatoEntrada = DateFormat("yyyy-MM-dd");
    DateFormat formatoSaida = DateFormat("dd/MM/yyyy");
    DateTime data = formatoEntrada.parse(dataString);
    return formatoSaida.format(data);
  }
  static DateTimeRange today() {
    DateTime now = DateTime.now();
    DateTime startOfDay = DateTime(now.year, now.month, now.day);
    DateTime endOfDay = startOfDay.add(Duration(days: 1)).subtract(Duration(milliseconds: 1));
    return DateTimeRange(start: startOfDay, end: endOfDay);
  }

  static DateTimeRange thisWeek() {
    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    DateTime endOfWeek = startOfWeek.add(Duration(days: 7)).subtract(Duration(milliseconds: 1));
    return DateTimeRange(start: startOfWeek, end: endOfWeek);
  }

  static DateTimeRange thisMonth() {
    DateTime now = DateTime.now();
    DateTime startOfMonth = DateTime(now.year, now.month, 1);
    DateTime endOfMonth = DateTime(now.year, now.month + 1, 0).add(Duration(days: 1)).subtract(Duration(milliseconds: 1));
    return DateTimeRange(start: startOfMonth, end: endOfMonth);
  }

  static DateTimeRange thisYear() {
    DateTime now = DateTime.now();
    DateTime startOfYear = DateTime(now.year, 1, 1);
    DateTime endOfYear = DateTime(now.year + 1, 1, 1).subtract(Duration(milliseconds: 1));
    return DateTimeRange(start: startOfYear, end: endOfYear);
  }
}
