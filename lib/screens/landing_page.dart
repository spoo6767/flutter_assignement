import 'package:assignmennt/core/controllers/main_controller.dart';
import 'package:assignmennt/screens/global_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final MainController _controller = Get.find<MainController>();
  @override
  void initState() {
    Get.find<MainController>().getcitizen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            body: _controller.loading
                ? GlobalWidgets.loader()
                : ListView.builder(
                    itemCount: _controller.data.length,
                    itemBuilder: (_, i) {
                      Map<String, dynamic> m = _controller.data[i];
                      return Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 10)
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Name: ' + m['name']),
                            const SizedBox(height: 5),
                            Text('Citizen Type id: ' +
                                m['citizen_type_id'].toString()),
                            const SizedBox(height: 5),
                            Text('Available: ' + m['available'].toString()),
                          ],
                        ),
                      );
                    }),
          ),
        );
      },
    );
  }
}
