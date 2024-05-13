import 'package:first_demo/page/page5_vm.dart';
import 'package:first_demo/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';

class Page5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Page5State();
}

class _Page5State extends State<Page5> {

  Page5ViewModal p5v = Page5ViewModal();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Page5ViewModal>(create: (context){
      return p5v;
    }, child: Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _banner(),
              _listView(),
            ],
          ),
        ),
      ),
    ),);
  }

  Widget _banner() {
    print('_banner 刷新');
    return Consumer<Page5ViewModal>(builder: (context, vm, child) {
      return Container(
        width: double.infinity,
        height: 200,
        child: Swiper(
          itemCount: vm.bannerData?.length ?? 0,
          itemBuilder: (context, index) {
            return Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Image.network(vm.bannerData?[index].imagePath ?? '', fit: BoxFit.fill,),
            );
          },
          autoplay: true,
        ),
      );
    });
  }

  Widget _listView(){
    print('_listView 刷新');
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 50,
        itemBuilder: (context, index) {
          return _listItemView();
        });
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

  @override
  void initState() {
    super.initState();
    p5v.getBanner();
  }
}
