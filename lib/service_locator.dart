import 'package:formation_juin_23/counter_with_bloc/logic/cubit/counter_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<CounterCubit>(
    CounterCubit()..decrement(),
  );
}
