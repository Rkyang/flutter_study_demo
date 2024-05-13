import 'package:flutter/material.dart';

class Page2 extends StatelessWidget{
  final String data_from_home;

  Page2({super.key, required this.data_from_home});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page2'),),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              child: Text('Home'),
              onPressed: (){Navigator.pop(context);},
            ),
          ),
          Text(data_from_home, style: TextStyle(fontSize: 30),)
        ],
      )
    );
  }

}