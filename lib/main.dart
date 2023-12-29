import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_app/presentation/home_view.dart';
import 'package:timer_app/utils/meta_colors.dart';
import 'package:timer_app/utils/meta_styles.dart';

import 'data/cubits/task_list_cubit/task_list_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskListCubit(),
      child: MaterialApp(
        title: 'Timer Application',
        theme: ThemeData(
          primaryColor: Colors.white,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white)),
          textTheme: MetaStyles.getTextTheme(),
          colorScheme: MetaColors.getColorScheme(),
        ),
        home: const MyHomePage(title: 'Timer Application'),
      ),
    );
  }
}
