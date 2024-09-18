import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:school/App/screens/clander/repository/clander_repository.dart';
class EventTile extends StatelessWidget {
  final ClassEvent event;

  const EventTile({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ListTile(
        title: Text(event.subject),
        subtitle: Text(event.room),
        trailing: Text(DateFormat('h:mm a').format(event.dateTime)),
      ),
    );
  }
}