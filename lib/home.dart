import 'package:flutter/material.dart';
import 'package:flutter_num_ins/rotate_widget.dart';
// import 'package:flutter_num_ins/widget_scale.dart';
// import 'package:flutter_num_ins/num_ins.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('data'),),
      body: Center(
        child: RotateWidget(
          begin: 1,
          end: 0,
          reverse: false,
          child: Container(
            width: 200,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              '立即领取',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                //  color: Colors.orange,
                gradient: LinearGradient(colors: [
                  Colors.cyan,
                  Colors.orange,
                  Colors.blue,
                ])),
          ),
        ),
        // child: AnimText(
        //   number: 25000,
        //   fontSize: 30,
        //   fontColor: Colors.cyan,
        //   duration: 2500,
        // ),
      ),
    );
  }
}
