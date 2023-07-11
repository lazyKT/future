import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExpandingActionButton extends StatelessWidget {
  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  const ExpandingActionButton ({
    super.key,
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    const double pi = 3.1415926535897932;

    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (pi / 180.00),
          progress.value * maxDistance
        );
        return Positioned(
          right: 3.0 + offset.dx,
          bottom: 3.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * pi / 2,
            child: child,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}