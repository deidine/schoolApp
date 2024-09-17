part of 'clander_bloc.dart';

sealed class ClanderEvent {}

class FetchInitialData extends ClanderEvent {}

class SearchData extends ClanderEvent {
  SearchData({required this.query});
  final String query;
}