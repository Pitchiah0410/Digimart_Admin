import 'package:chownow/constants/colors.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              InkWell(
                onTap: () {
                  
                },
                child: CircleAvatar(
                  child: Icon(Icons.person),
                  backgroundColor: primarycolor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}