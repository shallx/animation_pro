
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LightsaberController extends GetxController {

  bool isLightSaberDrawn = false;
  double height = 0;

  toggleLightSaber() {
    height = isLightSaberDrawn ? 0 : 240;
    isLightSaberDrawn = !isLightSaberDrawn;
    update();
    debugPrint("You triggerd the toggleLightSaber method");
    debugPrint(" height: $height | isLightSaberDrawn: $isLightSaberDrawn");
  }

}
