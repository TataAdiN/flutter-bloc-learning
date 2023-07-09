import 'package:flutter_bloc/flutter_bloc.dart';

import '../event/counter_event.dart';
import '../event/decrement.dart';
import '../event/increment.dart';

class CounterBloc extends Bloc<CounterEvent, int> {

  CounterBloc() : super(0) {
    on<CounterDecrement>((event, emit) => emit(event.count(state)));
    on<CounterIncrement>((event, emit) => emit(event.count(state)));
  }

}
