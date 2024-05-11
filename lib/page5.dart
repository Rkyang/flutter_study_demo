import 'package:first_demo/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class Page5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _banner(),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 50,
                  itemBuilder: (context, index) {
                    return _listItemView();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _banner() {
    return Container(
      width: double.infinity,
      height: 150,
      child: Swiper(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            height: 150,
            width: double.infinity,
            color: Colors.green,
            margin: EdgeInsets.all(10),
          );
        },
        autoplay: true,
      ),
    );
  }

  Widget _listItemView() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutePath.page5Child,
            arguments: {'name': 'static value params'});
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/test.jpg'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Another'),
                Expanded(
                  child: SizedBox(),
                ),
                Text('2024-05-10 12:00'),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Pin',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
            Text(
              'title title title title title ',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Row(
              children: [
                Text(
                  'Tag',
                  style: TextStyle(color: Colors.green),
                ),
                Expanded(
                  child: SizedBox(),
                ),
                Icon(Icons.favorite),
              ],
            )
          ],
        ),
      ),
    );
  }
}
