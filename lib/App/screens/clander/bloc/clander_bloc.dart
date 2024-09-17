import 'package:bloc/bloc.dart';

import 'package:school/App/core/enums/enums.dart';

part 'clander_event.dart';

part 'clander_state.dart';

class ClanderBloc extends Bloc<ClanderEvent, ClanderState> {
  ClanderBloc() : super(ClanderState()) {
    on<FetchInitialData>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      state.currentState = ActivityState.loaded;
      emit(state.copy());
    });
    on<SearchData>((event, emit) async {
      state.currentState = ActivityState.loading;
      emit(state.copy());
      await Future.delayed(const Duration(seconds: 1));
      state.currentState = ActivityState.loaded;
      emit(state.copy());
    });
  }
}