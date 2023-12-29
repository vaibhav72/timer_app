import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timer_app/data/models/timer_model.dart';

part 'task_list_state.dart';

/// [TaskListCubit] is responsible for managing the list of timers.
class TaskListCubit extends Cubit<TaskListState> {
  TaskListCubit() : super(const TaskListLoaded([]));
  void addTimer(ProjectTimer timer) {
    List<ProjectTimer> timers = [...(state as TaskListLoaded).timers];

    emit(TaskListLoading(timers));
    timers.add(timer);
    emit(TaskListLoaded(timers));
  }

  deleteTimer(ProjectTimer timer) {
    List<ProjectTimer> timers = [...(state as TaskListLoaded).timers];

    emit(TaskListLoading(timers));
    timers.remove(timer);
    emit(TaskListLoaded(timers));
  }
}
