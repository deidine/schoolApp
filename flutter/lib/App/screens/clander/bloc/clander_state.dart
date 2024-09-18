part of 'clander_bloc.dart';

abstract class CalendarState {}

class CalendarLoading extends CalendarState {}

class CalendarLoaded extends CalendarState {
  final DateTime selectedDate;
  final Map<DateTime, List<ClassEvent>> events;

  CalendarLoaded(  this.selectedDate, this.events);
}
