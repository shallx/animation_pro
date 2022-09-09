import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../views/animated_list_view.dart';

class AnimatedListController extends GetxController {
  List<String> list = [];

  List<String> apiDataList = [
    "Orange",
    "Apple",
    "Banana",
    "Mango",
    "Pineapple",
    "Watermelon",
    "Grapes",
    "Strawberry",
    "Papaya",
    "Guava",
  ];

  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    loadItems();
  }

  Future<void> loadItems() async {
    for (var data in apiDataList) {
      await Future.delayed(const Duration(milliseconds: 80));
      addToList(data);
    }
    update();
  }

  void addToList(String data) {
    list.add(data);
    listKey.currentState!.insertItem(
      list.length - 1,
      duration: const Duration(milliseconds: 400),
    );
    update();
  }

  void addToListAndScroll(String data) {
    addToList("Some Data");
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn);
  }

  void removeFromList(int index) {
    listKey.currentState!.removeItem(
      index,
      (context, animation) => HeightTransition(
        index: index,
        animation: animation,
        item: list[index],
      ),
      duration: const Duration(milliseconds: 400),
    );
    list.removeAt(index);
    update();
  }
}
