import 'package:animation_pro/controller/animated_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AnimatedListView extends StatelessWidget {
  const AnimatedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<AnimatedListController>(
        builder: (controller) {
          return SingleChildScrollView(
            controller: controller.scrollController,
            child: Column(
              children: [
                AnimatedList(
                  key: controller.listKey,
                  initialItemCount: 0,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: ((context, index, animation) => HeightTransition(
                        index: index,
                        animation: animation,
                        item: controller.list[index],
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.addToListAndScroll("Bluat");
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SlideListWidget extends StatelessWidget {
  const SlideListWidget({
    Key? key,
    required this.index,
    required this.animation,
    required this.item,
  }) : super(key: key);

  final int index;
  final Animation<double> animation;
  final String item;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: SizedBox(
        // Actual widget to display
        height: 80.0,
        child: Card(
          color: Colors.primaries[(1 + index) % Colors.primaries.length],
          child: Center(
            child: Text(item),
          ),
        ),
      ),
    );
  }
}

class HeightTransition extends StatelessWidget {
  const HeightTransition({
    Key? key,
    required this.index,
    required this.animation,
    required this.item,
  }) : super(key: key);

  final int index;
  final Animation<double> animation;
  final String item;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0,
        end: 1,
      ).animate(animation),
      child: SizedBox(
        height: 80,
        child: Card(
          color: Colors.primaries[(1 + index) % Colors.primaries.length],
          child: Center(
            child: Text(item),
          ),
        ),
      ),
    );
  }
}
