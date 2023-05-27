part of 'google_bloc.dart';

sealed class GoogleEvent extends Equatable {
  const GoogleEvent();
}

final class GetGoogle extends GoogleEvent {
  final String search;
  const GetGoogle({required this.search});

  @override
  List<Object> get props => [search];

  @override
  String toString() => 'GetGoogle { search: $search }';
}
