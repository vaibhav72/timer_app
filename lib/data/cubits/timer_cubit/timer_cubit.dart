import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

/// [TimerCubit] is responsible for managing the timer.
class TimerCubit extends Cubit<TimerState> {
  TimerCubit({
    required this.duration,
  }) : super(TimerInitial(duration));
  int duration;
  Timer? timer;

  void start() {
    emit(TimerRunInProgress(duration));
    timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  void pause() {
    timer?.cancel();
    emit(TimerRunPause(state.elapsed));
  }

  void toggle() {
    if (state is TimerRunPause || state is TimerInitial) {
      start();
    } else if (state is TimerRunInProgress) {
      pause();
    }
  }

  void reset() {
    timer?.cancel();
    emit(const TimerInitial(0));
  }

  void complete() {
    timer?.cancel();
    emit(TimerRunComplete(duration));
  }

  void _onTick(Timer timer) {
    duration = duration - 1;
    emit(TimerRunInProgress(duration));
    if (duration == 0) {
      complete();
    }
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}
