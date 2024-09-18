import 'package:school/App/screens/grade/bloc/grade_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 
class Grade extends StatefulWidget {
  const Grade({super.key});

  @override
  State<Grade> createState() => _GradeState();
}

class _GradeState extends State<Grade> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gradesBloc = BlocProvider.of<GradeBloc>(context);
    gradesBloc.add(LoadGradesEvent()); // Dispatch the event to load grades

    return Scaffold(
      appBar: AppBar(
        title: Text('My Grades'),
        elevation: 0,
      ),
      body: BlocBuilder<GradeBloc, GradeState>(
        builder: (context, state) {
          if (state is GradeLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GradeLoadedState) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Theme.of(context).primaryColor, Colors.white],
                ),
              ),
              child: ListView.builder(
                itemCount: state.grades.length,
                itemBuilder: (context, index) {
                  final grade = state.grades[index];
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(
                        grade.subject,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      subtitle: Text(
                          'Percentage: ${grade.percentage.toStringAsFixed(1)}%'),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            grade.grade,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: _getGradeColor(grade.grade),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            _getGradeDescription(grade.grade),
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(child: Text("Failed to load grades"));
          }
        },
      ),
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A+':
      case 'A':
        return Colors.green;
      case 'A-':
      case 'B+':
        return Colors.blue;
      case 'B':
      case 'B-':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  String _getGradeDescription(String grade) {
    switch (grade) {
      case 'A+':
        return 'Outstanding';
      case 'A':
        return 'Excellent';
      case 'A-':
        return 'Very Good';
      case 'B+':
        return 'Good';
      case 'B':
        return 'Above Average';
      default:
        return 'Average';
    }
  }
}
