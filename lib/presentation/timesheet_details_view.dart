import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:timer_app/data/cubits/timer_cubit/timer_cubit.dart';
import 'package:timer_app/data/models/project_model.dart';
import 'package:timer_app/data/models/task_model.dart';
import 'package:timer_app/data/models/timer_model.dart';
import 'package:timer_app/gen/assets.gen.dart';
import 'package:timer_app/utils/custom_widgets.dart';
import 'package:timer_app/utils/helper_methods.dart';

import 'package:timer_app/utils/placeholder_data.dart';

class TimeSheetDetailsView extends StatelessWidget {
  const TimeSheetDetailsView({
    super.key,
    required this.cubit,
    required this.timer,
  });
  final TimerCubit cubit;
  final ProjectTimer timer;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TaskModel task = tasks[timer.projectId]![timer.taskId]!;
    final ProjectModel project = projects[timer.projectId]!;
    return BlocProvider.value(
      value: cubit,
      child: DefaultTabController(
          length: 2,
          child: CustomScaffold(
            appBar: AppBar(
              title: Text(
                "TimeSheet Details",
                style: theme.textTheme.titleMedium,
              ),
              bottom: TabBar(
                indicatorWeight: 2,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      child: Text(
                        "Timesheets",
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "Details",
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TabBarView(children: [
                ListView(
                  children: [
                    _CurrentTimerWidget(task: task, timer: timer, cubit: cubit)
                  ],
                ),
                _CurrentTimerDetailsWidget(project: project, task: task)
              ]),
            ),
          )),
    );
  }
}

class _CurrentTimerDetailsWidget extends StatelessWidget {
  const _CurrentTimerDetailsWidget({
    super.key,
    required this.project,
    required this.task,
  });

  final ProjectModel project;
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListView(
      children: [
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Project",
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24,
                      child: VerticalDivider(
                        width: 2,
                        thickness: 2,
                        color: project.color,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      project.name,
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Deadline",
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  DateFormat('dd/MM/yyyy').format(task.deadline),
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  "Assigned To",
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  task.assignedTo,
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 4,
                ),
                ReadMoreText(
                  task.description,
                  trimLines: 2,
                  style: theme.textTheme.bodyMedium,
                  trimMode: TrimMode.Line,
                  moreStyle: theme.textTheme.bodySmall,
                  lessStyle: theme.textTheme.bodySmall,
                  trimCollapsedText: '\nRead more',
                  trimExpandedText: '\nRead less',
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _CurrentTimerWidget extends StatelessWidget {
  const _CurrentTimerWidget({
    super.key,
    required this.task,
    required this.timer,
    required this.cubit,
  });

  final TaskModel task;
  final ProjectTimer timer;
  final TimerCubit cubit;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat("EEEE").format(task.deadline),
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              DateFormat("dd.MM.yyyy").format(task.deadline),
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "Start Time ${getDuration(timer.timerValue)}",
              style: theme.textTheme.bodySmall,
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<TimerCubit, TimerState>(
              builder: (context, state) {
                return Row(
                  children: [
                    Expanded(
                      child: Text(
                        getDuration(state.elapsed),
                        style: theme.textTheme.displaySmall,
                      ),
                    ),
                    state is TimerRunInProgress
                        ? Row(
                            children: [
                              InkWell(
                                borderRadius: BorderRadius.circular(24),
                                onTap: () {
                                  cubit.complete();
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      theme.colorScheme.secondaryContainer,
                                  radius: 24,
                                  child: Assets.svg.stop.svg(),
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(24),
                                onTap: () {
                                  cubit.pause();
                                },
                                child: CircleAvatar(
                                  backgroundColor:
                                      theme.colorScheme.primaryContainer,
                                  radius: 24,
                                  child: Assets.svg.pause.svg(),
                                ),
                              )
                            ],
                          )
                        : state is TimerRunPause || state is TimerInitial
                            ? Row(
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(24),
                                    onTap: () {
                                      cubit.reset();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          theme.colorScheme.secondaryContainer,
                                      radius: 24,
                                      child: Assets.svg.stop.svg(),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  InkWell(
                                    borderRadius: BorderRadius.circular(24),
                                    onTap: () {
                                      cubit.start();
                                    },
                                    child: CircleAvatar(
                                      backgroundColor:
                                          theme.colorScheme.primaryContainer,
                                      radius: 24,
                                      child: Assets.svg.play.svg(
                                          colorFilter: const ColorFilter.mode(
                                              Colors.black, BlendMode.srcIn)),
                                    ),
                                  ),
                                ],
                              )
                            : Container()
                  ],
                );
              },
            ),
            const SizedBox(
              height: 16,
            ),
            Divider(
              thickness: 2,
              color: theme.colorScheme.secondary,
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: theme.textTheme.bodySmall,
                ),
                const Spacer(),
                Assets.svg.editPencil.svg(),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            ReadMoreText(
              timer.description,
              trimLines: 2,
              style: theme.textTheme.bodyMedium,
              trimMode: TrimMode.Line,
              moreStyle: theme.textTheme.bodySmall,
              lessStyle: theme.textTheme.bodySmall,
              trimCollapsedText: '\nRead more',
              trimExpandedText: '\nRead less',
            )
          ],
        ),
      ),
    );
  }
}
