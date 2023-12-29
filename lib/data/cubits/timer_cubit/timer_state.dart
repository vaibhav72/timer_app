part of 'timer_cubit.dart';

class TimerState extends Equatable {
  const TimerState(this.elapsed);
  final int elapsed;
  @override
  List<Object> get props => [elapsed];
}

class TimerInitial extends TimerState {
  const TimerInitial(int duration) : super(duration);
}

class TimerRunPause extends TimerState {
  const TimerRunPause(int elapsed) : super(elapsed);
}

class TimerRunInProgress extends TimerState {
  const TimerRunInProgress(int elapsed) : super(elapsed);
}

class TimerRunComplete extends TimerState {
  const TimerRunComplete(int elapsed) : super(elapsed);
}
