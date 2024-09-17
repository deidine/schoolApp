part of 'clander_bloc.dart';

class ClanderState {
  ClanderState({this.currentState = ActivityState.loading});

  ActivityState currentState;

  ClanderState copy() {
    return ClanderState(currentState: currentState);
  }
}