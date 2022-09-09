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
          body: SafeArea(child: Column(
            children: [
              const Spacer(),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AnimatedContainer(
                      curve: Curves.easeInToLinear,
                      duration: const Duration(milliseconds: 500),
                      height: controller.height,
                      child: const LightSaberTop(),
                    ),
                    const LightSaberBase(),
                    ElevatedButton(
                      onPressed: () {
                        controller.toggleLightSaber();
                      },
                      child: Text(
                        "${controller.isLightSaberDrawn ? 'Hide' : 'Draw'} Light Saber",
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}


class LightSaberTop extends StatelessWidget {
  const LightSaberTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 16,
      margin: const EdgeInsets.symmetric(
        horizontal: 22,
      ),
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.red,
            blurRadius: 10,
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
