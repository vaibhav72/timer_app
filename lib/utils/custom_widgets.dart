import 'package:flutter/material.dart';

import 'meta_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold(
      {super.key, this.appBar, this.body, this.floatingActionButton});
  final AppBar? appBar;
  final Widget? body;
  final FloatingActionButton? floatingActionButton;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: theme.brightness == Brightness.light
          ? const BoxDecoration(
              gradient: LinearGradient(colors: [
              MetaColors.gradientColorOne,
              MetaColors.gradientColorTwo
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter))
          : const BoxDecoration(color: Colors.black),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: body,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.theme,
    required this.title,
    this.onTap,
  });

  final ThemeData theme;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: 48,
        decoration: BoxDecoration(
            color: theme.colorScheme.secondaryContainer,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            title,
            style: theme.textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
