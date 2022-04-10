import 'package:assignmennt/approutes.dart';
import 'package:assignmennt/screens/global_component.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  TextEditingController phone = TextEditingController(),
      otp = TextEditingController();
  bool loading = false;
  Map<String, dynamic> res = <String, dynamic>{};
  List<Map<String, dynamic>> data = [];
  generateOtp() async {
    if (formKey.currentState!.validate()) {
      loading = true;
      update();
      var response = await Dio().get(
          'http://demosrvr2.optipacetech.com:8082/citizen/mob/api/checkmobilenumbergetOtp/${phone.text}');
      res = response.data;
      if (res["code"] == 1) {
        loading = false;
        update();
        Get.toNamed(AppRoutes.otp);
      } else {
        GlobalWidgets.showDialog(heading: 'Error', content: res["message"]);
        loading = false;
        update();
      }
    }
  }

  validateOtp() async {
    if (formKey2.currentState!.validate()) {
      loading = true;
      update();
      var response = await Dio().post(
          'http://demosrvr2.optipacetech.com:8082/citizen/mob/api/matchOTPNew',
          data: {"mobilenum": phone.text, "otp": otp.text});
      res = response.data;
      if (res["code"] == 1 || res["code"] == 6) {
        loading = false;
        update();
        Get.toNamed(AppRoutes.landing);
      } else {
        GlobalWidgets.showDialog(heading: 'Error', content: res["message"]);
        loading = false;
        update();
      }
    }
  }

  Future<void> getcitizen() async {
    try {
      var response = await Dio().get(
          'http://demosrvr2.optipacetech.com:8082/citizen/mob/api/citizentypeList');
      data.clear();
      for (int i = 0; i < response.data.length; i++) {
        data.add(response.data[i]);
      }
      loading = false;
      update();
    } catch (e) {
      GlobalWidgets.showDialog(heading: 'Error', content: res["message"]);
    }
  }
}
