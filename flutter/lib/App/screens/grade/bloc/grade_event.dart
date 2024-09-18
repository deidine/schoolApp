part of 'grade_bloc.dart';

abstract class GradeEvent {
  const GradeEvent();

  @override
  List<Object> get props => [];
}

class LoadGradesEvent extends GradeEvent {}
