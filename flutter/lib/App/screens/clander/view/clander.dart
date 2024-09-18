import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:school/App/screens/clander/repository/clander_repository.dart';
import 'package:school/App/screens/clander/view/event_title.dart';
 
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/clander_bloc.dart'; 
class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarBloc()..add(LoadCalendar(DateTime.now())),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Calendar'),
          backgroundColor: Color(0xFF5C4DB1),
          elevation: 0,
        ),
        body: BlocBuilder<CalendarBloc, CalendarState>(
          builder: (context, state) {
            if (state is CalendarLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CalendarLoaded) {
              return Column(
                children: [
                  _buildCalendarHeader(state.selectedDate),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          topRight: Radius.circular(32),
                        ),
                      ),
                      child: Column(
                        children: [
                          _buildCalendar(context, state),
                          Expanded(
                child: ListView(
                  children:
                      _getEventsForDay( state.selectedDate,state.events)
                          .map((event) => EventTile(event: event))
                          .toList(),
                ),),
                         ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Center(child: Text("Error loading calendar"));
            }
          },
        ),
      ),
    );
  }

  Widget _buildCalendarHeader(DateTime selectedMonth) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Color(0xFF5C4DB1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('${selectedMonth.month} ${selectedMonth.year}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Icon(Icons.arrow_drop_down, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildCalendar(BuildContext context, CalendarLoaded state) {
    return TableCalendar(
      focusedDay: state.selectedDate,
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      selectedDayPredicate: (day) {
        return isSameDay(state.selectedDate, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        context.read<CalendarBloc>().add(DateSelected(DateTime(selectedDay.year, selectedDay.month, selectedDay.day )));
      },
      calendarStyle: CalendarStyle(
        selectedDecoration: BoxDecoration(
          color: Color(0xFF5C4DB1),
          shape: BoxShape.circle,
        ),
        todayDecoration: BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
        ),
      ),
    );
  }



  List<ClassEvent> _getEventsForDay(
      DateTime day, Map<DateTime, List<ClassEvent>> eventMap) {
        print(day);
        print(eventMap );
    return eventMap[day] ?? [];
  }
 
  Widget _buildEventItem(String room, String title, String dateTime, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                room,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 111, 234, 238),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(dateTime, style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
