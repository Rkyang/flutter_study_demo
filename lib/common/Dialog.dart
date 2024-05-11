import 'package:first_demo/common/Http.dart';
import 'package:flutter/material.dart';
class MyDialog extends StatefulWidget{
  MyDialog({super.key, required this.content});
  String content;



  @override
  State<StatefulWidget> createState() => _MyDialogState();
}

class _MyDialogState extends State<MyDialog>{
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("这是alertDialog"),
      content: Text(widget.content),
      actions: [
        TextButton(onPressed: (){MyHttp.getHttp();}, child: Text("确认")),
        TextButton(onPressed: (){MyHttp.postHttp();}, child: Text("取消")),
      ],
    );
  }
}