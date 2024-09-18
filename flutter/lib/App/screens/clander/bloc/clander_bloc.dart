import 'package:bloc/bloc.dart';
import 'package:school/App/screens/clander/repository/clander_repository.dart';
 

part 'clander_event.dart';

part 'clander_state.dart';
 

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarLoading()) {
    on<LoadCalendar>(loadEvents);
    on<DateSelected>(_onDateSelected);
  }

  void loadEvents(LoadCalendar event, Emitter<CalendarState> emit) {
    // Simulating API call
    final events = _getEvents();
    emit(CalendarLoaded(event.selectedMonth, events));
  }

  void _onDateSelected(DateSelected event, Emitter<CalendarState> emit) {
    if (state is CalendarLoaded) {
      final currentState = state as CalendarLoaded;
      emit(CalendarLoaded(event.selectedDate, currentState.events));
    }
  }

  Map<DateTime, List<ClassEvent>> _getEvents() {
    final now = DateTime.now();
    return {
      DateTime(now.year, now.month, now.day + 1): [
        ClassEvent(DateTime(now.year, now.month, now.day + 1), 'Mathematics', 'Room 101'),
        ClassEvent(DateTime(now.year, now.month, now.day + 1), 'Science', 'Lab 201'),
      ],
      DateTime(now.year, now.month, now.day + 2): [
        ClassEvent(DateTime(now.year, now.month, now.day + 2, 0), 'History', 'Room 105'),
        ClassEvent(DateTime(now.year, now.month, now.day + 2, 0), 'English', 'Room 202'),
      ],
      DateTime(now.year, now.month, now.day + 3): [
        ClassEvent(DateTime(now.year, now.month, now.day + 3), 'Physical Education', 'Gym'),
      ],
    };
  }
}
