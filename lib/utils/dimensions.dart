import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; // 844
  static double screenWidth = Get.context!.width; // 411.4

  // Hauteur d'une slide entière (image + container blanc) :
  static double pageView = screenHeight / 2.7;

  // Hauteur de l'image d'une slide :
  static double pageViewContainer = screenHeight / 3.8;

  // Hauteur du container blanc dans une slide :
  static double pageViewTextContainer = screenHeight / 7.0;

  // Spacers or heights :
  static double height10 = screenHeight / 84.4;
  static double height15 = screenHeight / 56.27;
  static double height20 = screenHeight / 42.2;
  static double height30 = screenHeight / 28.14;
  static double height45 = screenHeight / 18.75;

  // Margins :
  static double width20 = screenWidth / 20.57;
  static double width30 = screenWidth / 13.75;

  // Font sizes :
  static double font20 = screenHeight / 42;

  // Border radiuses :
  static double radius15 = screenHeight / 56.3;
  static double radius20 = screenHeight / 42.0;
  static double radius30 = screenHeight / 28.2;

  // Icon size :
  static double iconSize24 = screenHeight / 35.17;
}
