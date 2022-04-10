import 'package:assignmennt/core/controllers/main_controller.dart';
import 'package:assignmennt/screens/global_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final MainController _controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          body: Form(
            key: _controller.formKey,
            child: Column(
              children: [
                const Spacer(),
                GlobalWidgets.contentTextViewer('Login Page',
                    alignment: Alignment.center,
                    size: 28,
                    color: Colors.deepPurpleAccent,
                    bottom: 28),
                GlobalWidgets.customField(
                    height: 80,
                    addpadding: true,
                    text: 'Phone Number',
                    maxLength: 10,
                    controller: _controller.phone,
                    type: TextInputType.number,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Phone number should not be empty';
                      } else if (val.isNotEmpty && val.length < 10) {
                        return 'Incomplete number';
                      } else {
                        return null;
                      }
                    }),
                const Spacer(),
                _controller.loading
                    ? GlobalWidgets.loader(bottom: 28)
                    : GlobalWidgets.bottomButton('Generate OTP',
                        function: _controller.generateOtp)
              ],
            ),
          ),
        ),
      );
    });
  }
}
