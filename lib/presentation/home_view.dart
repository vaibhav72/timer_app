import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timer_app/data/cubits/task_list_cubit/task_list_cubit.dart';
import 'package:timer_app/data/cubits/timer_cubit/timer_cubit.dart';
import 'package:timer_app/data/models/timer_model.dart';
import 'package:timer_app/presentation/timesheet_details_view.dart';
import 'package:timer_app/utils/custom_widgets.dart';
import 'package:timer_app/utils/helper_methods.dart';

import 'package:timer_app/utils/placeholder_data.dart';

import '../gen/assets.gen.dart';
import 'create_timer_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Timesheets",
          style: theme.textTheme.headlineLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => const CreateTimerView()));
              },
              child: Container(
                  decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8)),
                  height: 40,
                  width: 40,
                  child: Center(child: Assets.svg.add.svg())),
            ),
          )
        ],
      ),
      body: BlocBuilder<TaskListCubit, TaskListState>(
        builder: (context, state) {
          if (state is TaskListLoaded) {
            if (state.timers.isEmpty) {
              return const _NoTimersWidget();
            }

            return ListView.builder(
                itemCount: state.timers.length,
                itemBuilder: (context, index) {
                  return BlocProvider(
                    create: (context) =>
                        TimerCubit(duration: state.timers[index].timerValue),
                    child: TimerListTile(data: state.timers[index]),
                  );
                });
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _NoTimersWidget extends StatelessWidget {
  const _NoTimersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          height: 192,
                          width: 192,
                          decoration: BoxDecoration(
                              color: theme.colorScheme.secondaryContainer,
                              borderRadius: BorderRadius.circular(32)),
                          child: Center(child: Assets.svg.noTimers.svg())),
                      const SizedBox(height: 32),
                      Center(
                        child: Text(
                          "You don’t have any local timesheets",
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineMedium,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Center(
                          child: Text(
                        "Create a timer to to begin tracking time",
                        style: theme.textTheme.bodyLarge,
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CustomButton(
                  title: "Get Started",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => const CreateTimerView()));
                  },
                  theme: theme),
            )
          ],
        ),
      ),
    );
  }
}

class TimerListTile extends StatelessWidget {
  const TimerListTile({
    super.key,
    required this.data,
  });
  final ProjectTimer data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final project = projects[data.projectId];
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, timerState) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => TimeSheetDetailsView(
                          cubit: context.read<TimerCubit>(),
                          timer: data,
                        )));
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
                decoration: BoxDecoration(
                    color: theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 80,
                        child: VerticalDivider(
                          color: project!.color,
                          thickness: 2,
                        ),
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              data.isFavorite
                                  ? Assets.svg.starFilled.svg()
                                  : Assets.svg.starEmpty.svg(),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  tasks[data.projectId]![data.taskId]!.name,
                                  style: theme.textTheme.titleMedium,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Assets.svg.project.svg(),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  projects[data.projectId]!.name,
                                  style: theme.textTheme.bodyMedium,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Assets.svg.deadline.svg(),
                              const SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  "Deadline ${DateFormat('dd/MM/yyyy').format(tasks[data.projectId]![data.taskId]!.deadline)}",
                                  style: theme.textTheme.bodyMedium,
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: 48,
                          constraints: const BoxConstraints(minWidth: 106),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(64),
                            color: timerState is TimerRunInProgress
                                ? theme.colorScheme.primaryContainer
                                : theme.colorScheme.secondaryContainer,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(getDuration(timerState.elapsed),
                                    style: theme.textTheme.labelLarge!.copyWith(
                                        color: timerState is TimerRunInProgress
                                            ? Colors.black
                                            : theme.colorScheme.primary)),
                                InkWell(
                                    onTap: () {
                                      if (timerState is! TimerRunComplete) {
                                        context.read<TimerCubit>().toggle();
                                      }
                                    },
                                    child: timerState is TimerRunPause ||
                                            timerState is TimerInitial
                                        ? Assets.svg.play.svg(
                                            width: 24,
                                          )
                                        : timerState is TimerRunInProgress
                                            ? Assets.svg.pause.svg(
                                                width: 24,
                                              )
                                            : Container()),
                              ],
                            ),
                          ))
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
