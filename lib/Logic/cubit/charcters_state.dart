part of 'charcters_cubit.dart';

@immutable
sealed class CharctersState {}

final class CharctersInitial extends CharctersState {}
final class CharctersLoded extends CharctersState {
  final List<Result> characters;
  CharctersLoded(this.characters);
}

final class CharctersError extends CharctersState {
  final String error;
  CharctersError(this.error);
}
