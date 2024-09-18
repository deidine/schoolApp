part of 'clander_bloc.dart';
 
sealed class CalendarEvent {}


class LoadCalendar extends CalendarEvent {
  final DateTime selectedMonth;
  LoadCalendar(this.selectedMonth);
}

class DateSelected extends CalendarEvent {
  final DateTime selectedDate;
  DateSelected(this.selectedDate);
  }