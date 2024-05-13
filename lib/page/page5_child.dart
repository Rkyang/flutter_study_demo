import 'package:flutter/material.dart';

class Page5Child extends StatefulWidget{
  final String? title;
  const Page5Child({super.key, this.title});

  @override
  State<StatefulWidget> createState() => _Page5ChildState();

}

class _Page5ChildState extends State<Page5Child>{
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title ?? name),),
      body: SafeArea(
        child: Container(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // 组件初始化后获取路由参数
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var map = ModalRoute.of(context)?.settings.arguments;
      if (map is Map) {
        name = map['name'];
        setState(() {});
      }
    });
  }
}