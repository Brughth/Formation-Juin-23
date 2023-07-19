import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_juin_23/counter_with_bloc/logic/cubit/counter_cubit.dart';

import '../../posts_api/posts/presentation/pages/posts_screen.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App with Bloc"),
      ),
      body: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.counter == 15) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Bravo!! vous avez gagnee"),
              ),
            );
          }

          if (state.counter == 20) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PostsScreen(
                  title: "POSTS API",
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          return Center(
            child: Text(
              state.counter.toString(),
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.w900,
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
