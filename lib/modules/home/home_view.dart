import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/counter_bloc.dart';
import 'event/decrement.dart';
import 'event/increment.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) => Center(child: Text('$count')),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
      heroTag: 1,
            child: const Icon(Icons.add),
            onPressed: () => context.read<CounterBloc>().add(CounterIncrement()),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
              heroTag: 2,
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CounterBloc>().add(CounterDecrement()),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
              heroTag: 3,
            child: const Icon(Icons.arrow_right),
            onPressed: () => context.goNamed('auth'),
          ),
        ],
      ),
    );
  }
}