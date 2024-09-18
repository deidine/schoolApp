part of 'grade_bloc.dart';

abstract class GradeState  {
  const GradeState();

  @override
  List<Object> get props => [];
}

class GradeLoadingState extends GradeState {}

class GradeLoadedState extends GradeState {
  final List<Grade> grades;

  const GradeLoadedState(this.grades);

  @override
  List<Object> get props => [grades];
}
