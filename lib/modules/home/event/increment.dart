import 'counter_event.dart';

class CounterIncrement extends CounterEvent {

  @override
  int count(int value) {
    return value+1;
  }

}