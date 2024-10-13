import 'package:flutter/material.dart';

class CustomScrollWidget extends StatelessWidget {
  final Widget child;
  const CustomScrollWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        ),
      ],
    );
  }
}
