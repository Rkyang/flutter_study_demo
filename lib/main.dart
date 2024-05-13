import 'package:first_demo/common/Dialog.dart';
import 'package:first_demo/page/page2.dart';
import 'package:first_demo/page/page3.dart';
import 'package:first_demo/page/page4.dart';
import 'package:first_demo/page/page5.dart';
import 'package:first_demo/route/routes.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
      theme: ThemeData(),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RoutePath.home,
      // home: Home()
  ));
}

class Home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<Home> {
  var count = 0;
  var c1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('this is title'),
        backgroundColor: Color.fromRGBO(255, 0, 0, 0.5),
      ),
      // body: Center(
      //   child: Text(
      //     count.toString(),
      //     style: TextStyle(fontSize: 50),
      //   ),
      // ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            child: GestureDetector(
              child: Text(
                count.toString(),
                style: TextStyle(fontSize: 50),
              ),
              onTap: () {
                print('click one');
              },
              onLongPress: () {
                print('long press');
              },
              onDoubleTap: () {
                print('double click');
              },
            ),
            height: 300,
            width: 300,
            alignment: Alignment.center,
          ),
          TextField(
            controller: c1,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print(c1.text);
            },
            child: Text('get Input'),
          ),
          Container(
              height: 300,
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('images/test.jpg'),
                      ),
                      title: Text('123'),
                      subtitle: Text('asdf'),
                      trailing: Text(DateTime.now().toString()),
                    );
                  })),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    _showAlertDialog('asdkaskdkasdsd');
                  },
                  child: Text('AlertDialog')),
              ElevatedButton(
                  onPressed: _showButtomSheet, child: Text('ButtomSheet')),
            ],
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Page2(
                                  data_from_home: 'Home Data',
                                )));
                  },
                  child: Text('Page 2')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => page3()));
                  },
                  child: Text('Page 3')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => page4()));
                  },
                  child: Text('Page 4')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RoutePath.page5);
                  },
                  child: Text('Page 5')),
            ],
          )
          // Container(
          //   height: 200,
          //   child: ListView.builder(
          //       itemCount: 20,
          //       itemBuilder: (BuildContext context, int index) {
          //         return Text('data-$index', style: TextStyle(fontSize: 30),);
          //       }),
          // ),
          // Container(
          //   height: 200,
          //   child: ListView.separated(
          //     itemCount: 20,
          //       itemBuilder: (BuildContext context1, int index) {
          //         return Text('data-$index', style: TextStyle(fontSize: 30),);
          //       },
          //       separatorBuilder: (BuildContext context, int index) {
          //         return Divider(color: Colors.green, height: 20,);
          //       }),
          // ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            count++;
          });
        },
      ),
    );
  }

  void _showAlertDialog(String content) {
    showDialog(
        context: context,
        builder: (_) {
          return MyDialog(content: content);
          // AlertDialog(
          // title: Text("这是alertDialog"),
          // content: Text(content),
          // actions: [
          //   TextButton(onPressed: (){Navigator.pop(context);}, child: Text("确认")),
          //   TextButton(onPressed: (){Navigator.pop(context);}, child: Text("取消")),
          // ],
          // );
        });
  }

  void _showButtomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 50,
            color: Colors.blue,
            child: Center(
              child: Text(
                'sdsdsd',
                style: TextStyle(fontSize: 30),
              ),
            ),
          );
        });
  }
}
