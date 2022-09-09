import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

class LightsaberController extends GetxController
    with GetTickerProviderStateMixin {
  bool isLightSaberDrawn = false;
  double height = 0;
  late AnimationController shadowAnimController, animeController;
  late Animation drawAnimation, swingAnimation, tugAnimation;

  @override
  void onInit() {
    super.onInit();
    shadowAnimController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animeController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    drawAnimation = Tween<double>(begin: 0, end: 240).animate(
      CurvedAnimation(
        parent: animeController,
        curve: const Interval(
          0,
          .50,
          curve: Curves.easeInOut,
        ),
      ),
    );

    /* swingAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.5), weight: 1),
      TweenSequenceItem(tween: Tween(begin: 0.5, end: 0.0), weight: 1),
    ]) */

    swingAnimation = Tween<double>(begin: 0, end: math.pi / 4).animate(
      CurvedAnimation(
        parent: animeController,
        curve: const Interval(
          .3,
          1,
          curve: Curves.easeInOut,
        ),
      ),
    );
  }

  toggleLightSaber() {
    height = isLightSaberDrawn ? 0 : 240;
    isLightSaberDrawn = !isLightSaberDrawn;
    update();

    if (isLightSaberDrawn) {
      Future.delayed(const Duration(milliseconds: 200), () {
        shadowAnimController.repeat(
          reverse: true,
        );
      });
      animeController.forward();
    } else {
      shadowAnimController.stop();
      animeController.reverse();
    }
  }

  @override
  void dispose() {
    super.dispose();
    shadowAnimController.dispose();
    animeController.dispose();
  }
}
