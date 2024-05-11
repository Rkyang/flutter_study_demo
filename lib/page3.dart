import 'package:flutter/material.dart';

class page3 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _page3State();

}

class _page3State extends State<page3>{

  @override
  void initState() {
    super.initState();
    print('page 3 initialized');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 3'),
      ),
      body: Row(
        children: [
          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Home'))
        ],
      ),
    );
  }

}