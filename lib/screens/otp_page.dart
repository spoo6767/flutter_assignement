import 'package:assignmennt/approutes.dart';
import 'package:assignmennt/core/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'global_component.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({Key? key}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final MainController _controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          body: Form(
            key: _controller.formKey2,
            child: Column(
              children: [
                const Spacer(),
                GlobalWidgets.contentTextViewer('OTP Page',
                    alignment: Alignment.center,
                    size: 28,
                    color: Colors.deepPurpleAccent,
                    bottom: 28),
                GlobalWidgets.customField(
                    height: 80,
                    addpadding: true,
                    text: 'OTP',
                    type: TextInputType.number,
                    controller: _controller.otp,
                    maxLength: 4,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Phone number should not be empty';
                      } else if (val.isNotEmpty && val.length < 4) {
                        return 'Incomplete number';
                      } else {
                        return null;
                      }
                    }),
                const Spacer(),
                _controller.loading
                    ? GlobalWidgets.loader(bottom: 28)
                    : GlobalWidgets.bottomButton('Generate OTP',
                        function: _controller.validateOtp),
              ],
            ),
          ),
        ),
      );
    });
  }
}
