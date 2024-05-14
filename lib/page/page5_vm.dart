import 'package:dio/dio.dart';
import 'package:first_demo/datas/list_view_data.dart';
import 'package:flutter/cupertino.dart';

import '../datas/banner_data.dart';

class Page5ViewModal with ChangeNotifier{
  List<BannerDataItem>? bannerData;
  List<Datas>? listviewDataList;
  Future getBanner()async{
    Dio dio = Dio();
    dio.options = BaseOptions(
      method: 'get',
      baseUrl: 'https://www.wanandroid.com/',
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30)
    );
    Response response = await dio.get('banner/json');
    BannerData bData = BannerData.fromJson(response.data);
    if (bData.data != null) {
      bannerData = bData.data;
    } else {
      bannerData = [];
    }
    notifyListeners();
  }

  Future getListView()async{
    Dio dio = Dio();
    dio.options = BaseOptions(
      method: 'get',
      baseUrl: 'https://www.wanandroid.com/',
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30)
    );
    Response response = await dio.get('article/list/0/json');
    ListViewData listViewData = ListViewData.fromJson(response.data);
    if (listViewData.data != null) {
      listviewDataList = listViewData.data?.datas;
    } else {
      listviewDataList = [];
    }
    notifyListeners();
  }
}