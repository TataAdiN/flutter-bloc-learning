import 'counter_event.dart';

class CounterDecrement extends CounterEvent {

  @override
  int count(int value) {
    return value-1;
  }

}