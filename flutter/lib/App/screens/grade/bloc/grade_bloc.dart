import 'package:bloc/bloc.dart';

import '../repository/grade_repository.dart'; 
part 'grade_event.dart';
part 'grade_state.dart';

class GradeBloc extends Bloc<GradeEvent, GradeState> {
  GradeBloc() : super(GradeLoadingState()) {
    on<LoadGradesEvent>(_onLoadGrades);
  }

  void _onLoadGrades(LoadGradesEvent event, Emitter<GradeState> emit) {
    // Simulating API call with a slight delay
    final grades = [
      Grade('Mathematics', 'A', 95.0),
      Grade('Science', 'B+', 88.5),
      Grade('History', 'A-', 91.0),
      Grade('English', 'B', 85.0),
      Grade('Physical Education', 'A+', 98.0),
    ];

    emit(GradeLoadedState(grades));
  }
}

// BLoC for Grades
