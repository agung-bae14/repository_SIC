import 'dart:async';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  var currentDate = ''.obs;
  var currentTime = ''.obs;
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    startClock();
  }

  void startClock() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      DateTime now = DateTime.now();
      currentDate.value = DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(now);
      currentTime.value = DateFormat('HH:mm').format(now);
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
