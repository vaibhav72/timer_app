import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timer_app/data/cubits/task_list_cubit/task_list_cubit.dart';
import 'package:timer_app/data/models/project_model.dart';
import 'package:timer_app/data/models/timer_model.dart';
import 'package:timer_app/gen/assets.gen.dart';
import 'package:timer_app/utils/custom_widgets.dart';
import 'package:timer_app/utils/meta_colors.dart';
import 'package:timer_app/utils/meta_styles.dart';
import 'package:timer_app/utils/placeholder_data.dart';

import '../data/models/task_model.dart';

/// [CreateTimerView] is responsible for creating a new timer.
class CreateTimerView extends StatefulWidget {
  const CreateTimerView({super.key});

  @override
  State<CreateTimerView> createState() => _CreateTimerViewState();
}

class _CreateTimerViewState extends State<CreateTimerView> {
  final TextEditingController _descriptionController = TextEditingController();
  ProjectModel? _selectedProject;
  TaskModel? _selectedTask;
  bool makeFavorite = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return CustomScaffold(
      appBar: AppBar(
        title: Text(
          "Create Timer",
          style: theme.textTheme.headlineSmall,
        ),
      ),
      body: BlocBuilder<TaskListCubit, TaskListState>(
        builder: (context, state) {
          if (state is TaskListLoading) {
            return const CircularProgressIndicator();
          }
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropdownButtonFormField(
                              dropdownColor: MetaColors.gradientColorOne,
                              borderRadius: BorderRadius.circular(8),
                              icon: Assets.svg.dropdownArrow.svg(),
                              decoration: MetaStyles.getInputDecoration(
                                  label: "Project", theme: theme),
                              value: _selectedProject,
                              selectedItemBuilder: (ctx) => projects.values
                                  .toList()
                                  .map((project) => Text(
                                        project.name,
                                        style: theme.textTheme.bodyLarge,
                                      ))
                                  .toList(),
                              items: projects.values
                                  .toList()
                                  .map((project) => DropdownMenuItem(
                                        value: project,
                                        child: _ProjectDropDownMenuItem(
                                            project: project, theme: theme),
                                      ))
                                  .toList(),
                              onChanged: _handleProjectSelection),
                          const SizedBox(
                            height: 24,
                          ),
                          DropdownButtonFormField(
                              dropdownColor: MetaColors.gradientColorOne,
                              icon: Assets.svg.dropdownArrow.svg(),
                              decoration: MetaStyles.getInputDecoration(
                                  label: "Task", theme: theme),
                              value: _selectedTask,
                              selectedItemBuilder: (context) {
                                return (_selectedProject?.id == null
                                        ? <TaskModel>[]
                                        : tasks[_selectedProject?.id ?? ""]!
                                            .values
                                            .toList())
                                    .map((task) => Text(
                                          task.name,
                                          style: theme.textTheme.bodyLarge,
                                        ))
                                    .toList();
                              },
                              items: (_selectedProject?.id == null
                                      ? <TaskModel>[]
                                      : tasks[_selectedProject?.id ?? ""]!
                                          .values
                                          .toList())
                                  .map((task) => DropdownMenuItem(
                                        value: task,
                                        child: _TaskDropDownMenuItem(
                                            theme: theme, task: task),
                                      ))
                                  .toList(),
                              onChanged: _handleTaskSelection),
                          const SizedBox(
                            height: 24,
                          ),
                          Center(
                            child: TextFormField(
                              controller: _descriptionController,
                              style: theme.textTheme.bodyLarge,
                              decoration: MetaStyles.getInputDecoration(
                                  label: "Description", theme: theme),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          InkWell(
                            onTap: toggleFavorite,
                            child: Row(
                              children: [
                                makeFavorite
                                    ? Assets.svg.checkBoxNew.svg(
                                        height: 24,
                                        width: 24,
                                      )
                                    : Center(
                                        child: Assets.svg.checkboxEmpty.svg(
                                          height: 24,
                                          width: 24,
                                        ),
                                      ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  "Make Favorite",
                                  style: theme.textTheme.bodyLarge,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    theme: theme,
                    title: "Create Timer",
                    onTap: _createTimer,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleProjectSelection(ProjectModel? value) {
    setState(() {
      _selectedProject = value;
      _selectedTask = null;
    });
  }

  void _handleTaskSelection(TaskModel? value) {
    setState(() {
      _selectedTask = value;
    });
  }

  void toggleFavorite() {
    setState(() {
      makeFavorite = !makeFavorite;
    });
  }

  void _createTimer() {
    final cubit = context.read<TaskListCubit>();
    final ThemeData theme = Theme.of(context);
    if (!_formKey.currentState!.validate()) return;
    if (_selectedProject == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: theme.colorScheme.onErrorContainer,
        content: const Text("Please select a project"),
      ));
      return;
    }
    if (_selectedTask == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: theme.colorScheme.onErrorContainer,
        content: const Text("Please select a task"),
      ));
      return;
    }
    cubit.addTimer(ProjectTimer(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        timerValue:
            _selectedTask!.deadline.difference(DateTime.now()).inSeconds,
        description: _descriptionController.text,
        projectId: _selectedProject!.id,
        taskId: _selectedTask!.id,
        isFavorite: makeFavorite));
    Navigator.pop(context);
  }
}

class _TaskDropDownMenuItem extends StatelessWidget {
  const _TaskDropDownMenuItem({
    super.key,
    required this.theme,
    required this.task,
  });

  final ThemeData theme;
  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: theme.colorScheme.primary,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.name,
                style: theme.textTheme.bodyLarge,
              ),
              Row(
                children: [
                  Assets.svg.deadline.svg(),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Deadline ${DateFormat('dd/MM/yyyy').format(task.deadline)}",
                    style: theme.textTheme.bodyMedium,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectDropDownMenuItem extends StatelessWidget {
  const _ProjectDropDownMenuItem({
    super.key,
    required this.theme,
    required this.project,
  });
  final ProjectModel project;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        project.name,
        style: theme.textTheme.bodyLarge,
      ),
    );
  }
}
