import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class Assignment extends StatefulWidget {
  const Assignment({Key? key}) : super(key: key);

  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  String _enteredText = '';
  String _enteredTextes = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [

            Row(

              children: [
                Container(
                  padding: EdgeInsets.only(top: 30,left: 30),
                  height: 500,
                  width: 500,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 400,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)
                              ),
                              child: Center(
                                child: Text(' TEST APP  ',
                                  style: TextStyle(fontSize: 18,color: Colors.black),),
                              ),                          )
                          ],
                        ),
                          Row(
                            children: [
                              Container(
                                height: 150,
                                width: 200,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)
                                ),
                                child: Text('TYPE HERE....!'),
                              ),
                              Container(
                                height:150,
                                width: 200,
                                // color: Colors.white,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)
                                ),
                                child: Text('ABCDEFG'),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 200,
                                width: 400,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black)
                                ),
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30,left:
                  30),
                  height: 500,
                  width: 500,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 400,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child: Center(
                              child: Text(' TEST APP  ',
                                style: TextStyle(fontSize: 18,color: Colors.black),),
                            ),                          )
                        ],
                      ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       height: 150,
                        //       width: 200,
                        //       // color: Colors.white,
                        //       decoration: BoxDecoration(
                        //         border: Border.all(color: Colors.black)
                        //       ),
                        //       child: TextField(
                        //         // onChanged: (value){
                        //         //   _enteredText = value;
                        //         //
                        //         // },
                        //       )
                        //     ),
                        //     Container(
                        //       height:150,
                        //       width: 200,
                        //       // color: Colors.white,
                        //       decoration: BoxDecoration(
                        //         border: Border.all(color: Colors.black)
                        //       ),
                        //       child: Text('ABCDEFG'),
                        //     ),
                        //   ],
                        // ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 400,
                              width: 200,
                           child: TextField(
                               onChanged: (value) {
                setState(() {
                _enteredTextes = value;
                });
                },
                  decoration: InputDecoration(
                  hintText: 'MOBILE :',
                    // labelText: 'Your Name',
                    border: const OutlineInputBorder(),
                    // Display the number of entered characters
                    counterText: '${_enteredTextes.length.toString()} '),
                ),
    ),
                            Container(
                              height: 400,
                              width: 200,
                           decoration: BoxDecoration(
                             border: Border.all(color: Colors.white10)
                           ),
                           child: TextField(
                             // inputFormatters: [
                             //   new LengthLimitingTextInputFormatter(10),
                             // ],
                             maxLength: 20,
                            minLines: 1,

                            onChanged: (value) {
                             setState(() {
                            _enteredText = value;
                });
                },
                  decoration: InputDecoration(
                  hintText: ' ',
                    // labelText: 'Your Name',
                    border: const OutlineInputBorder(),
                    // Display the number of entered characters
                    counterText: '${_enteredText.length.toString()} '),
                ),
    ),



                            // Container(
                            //   height: 200,
                            //   width: 400,
                            //   decoration: BoxDecoration(
                            //       border: Border.all(color: Colors.black)
                            //   ),
                            //   child: Column(),
                            // )


                          ],
                        )
                    ],
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
