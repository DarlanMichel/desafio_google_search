part of 'google_bloc.dart';

sealed class GoogleState extends Equatable {
  const GoogleState();

  @override
  List<Object> get props => [];
}

final class GoogleStateEmpty extends GoogleState {}

final class GoogleStateLoading extends GoogleState {}

final class GoogleStateSuccess extends GoogleState {
  final List<GoogleEntity> entity;

  const GoogleStateSuccess({required this.entity});

  @override
  List<Object> get props => [entity];

  @override
  String toString() => 'GoogleStateSuccess { entity: ${entity.length} }';
}

final class GoogleStateError extends GoogleState {
  const GoogleStateError({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
