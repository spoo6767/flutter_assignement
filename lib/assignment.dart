import 'package:flutter/material.dart';

class Assignment extends StatefulWidget {
  const Assignment({Key? key}) : super(key: key);

  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  String text1 = '';
  String text2 = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 40,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                alignment: Alignment.center,
                child: const Text(
                  'TEST APP',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 12, 10, 10)),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        height: 50,
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                            bottom: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              text1 = value;
                            });
                          },
                          decoration: const InputDecoration(
                              hintText: 'Type Here...',
                              border: InputBorder.none),
                        )),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.black),
                          bottom: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: TextField(
                        maxLength: 20,
                        minLines: 1,
                        onChanged: (value) {
                          setState(() {
                            text2 = value;
                          });
                        },
                        decoration: const InputDecoration(
                            hintText: 'ABCDEFG',
                            border: InputBorder.none,
                            counterText: ''),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Transform.rotate(
                angle: ((text2.isEmpty ? 1 : text2.length) -
                        (text1.isEmpty ? 1 : text1.length)) /
                    90,
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.blue,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 26,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text('${text1.length}'),
                      ),
                      Container(
                        width: 40,
                        height: 26,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Text('${text2.length}'),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
