import 'package:animation_pro/controller/lightsaber_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LightSaberView extends StatelessWidget {
  const LightSaberView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LightsaberController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Column(
              children: [
                const Spacer(),
                AnimatedBuilder(
                    animation: controller.animeController,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: controller.swingAnimation.value,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AnimatedBuilder(
                                animation: controller.shadowAnimController,
                                builder: (context, child) => SizedBox(
                                  height: controller.drawAnimation.value,
                                  child: LightSaberTop(
                                    blurRadius: (5 +
                                            controller.shadowAnimController
                                                    .value *
                                                15)
                                        .toDouble(),
                                  ),
                                ),
                              ),
                              const LightSaberBase(),
                            ],
                          ),
                        ),
                      );
                    }),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.toggleLightSaber();
                    },
                    child: Text(
                      "${controller.isLightSaberDrawn ? 'Hide' : 'Draw'} Light Saber",
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class LightSaberTop extends StatelessWidget {
  const LightSaberTop({
    Key? key,
    this.blurRadius,
  }) : super(key: key);

  final double? blurRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 16,
      margin: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            blurRadius: blurRadius ?? 5,
          )
        ],
      ),
    );
  }
}

class LightSaberBase extends StatelessWidget {
  const LightSaberBase({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 14,
          width: 60,
          color: Colors.black,
        ),
        Container(
          height: 100,
          width: 20,
          color: Colors.black,
        ),
      ],
    );
  }
}
