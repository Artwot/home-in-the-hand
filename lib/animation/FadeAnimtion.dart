import 'package:supercharged/supercharged.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final _tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0), 500.milliseconds)
      ..add(AniProps.translateY, Tween(begin: -300.0, end: 0.0), 500.milliseconds, Curves.easeOut);

    /*final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -300.0, end: 0.0),
          curve: Curves.easeOut),
    ]);*/

    return CustomAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: _tween.duration,
      tween: _tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation[AniProps.opacity],
        child: Transform.translate(
          offset: Offset(
            0.0,
            animation[AniProps.translateY],
          ),
          child: child,
        ),
      ),
    );
  }
}
