part of 'task_list_cubit.dart';

class TaskListState extends Equatable {
  const TaskListState(this.timers);
  final List<ProjectTimer> timers;
  @override
  List<Object> get props => [timers];
}

class TaskListLoaded extends TaskListState {
  const TaskListLoaded(List<ProjectTimer> timers) : super(timers);
}

class TaskListLoading extends TaskListState {
  const TaskListLoading(List<ProjectTimer> timers) : super(timers);
}
