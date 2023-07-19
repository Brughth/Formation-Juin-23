// ignore_for_file: must_be_immutable

part of 'counter_cubit.dart';

@immutable
class CounterState {
  final int counter;

  const CounterState({
    required this.counter,
  });

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
