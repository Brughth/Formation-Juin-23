import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(
          const CounterState(
            counter: 10,
          ),
        );

  void increment() => emit(
        //CounterState(counter: state.counter + 1),
        state.copyWith(
          counter: state.counter + 1,
        ),
      );
  void decrement() => emit(
        //CounterState(counter: state.counter - 1),
        state.copyWith(
          counter: state.counter - 1,
        ),
      );
}
