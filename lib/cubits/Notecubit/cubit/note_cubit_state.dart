part of 'note_cubit_cubit.dart';

@immutable
sealed class NoteCubitState {}

final class NoteCubitInitial extends NoteCubitState {}

final class NoteCubLoading extends NoteCubitState {}

final class NoteCubitSuccess extends NoteCubitState {
  final List<Notemodel> notes;

  NoteCubitSuccess(this.notes);
}

final class NoteCubitFailure extends NoteCubitState {
  final String errmessage;

  NoteCubitFailure(this.errmessage);
}
