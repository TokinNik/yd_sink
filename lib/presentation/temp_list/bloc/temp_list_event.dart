part of 'temp_list_bloc.dart';

class TempListScreenEvent {
  TempListScreenEvent._();

  factory TempListScreenEvent.init() => TempListScreenInitEvent();
}

class TempListScreenInitEvent extends TempListScreenEvent {
  TempListScreenInitEvent() : super._();
}
