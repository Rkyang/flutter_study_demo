import 'package:dio/dio.dart';

import '../datas/banner_data.dart';

class Page5ViewModal{
  static Future<List<BannerDataItem>?> getBanner()async{
    Dio dio = Dio();
    dio.options = BaseOptions(
      method: 'get',
      baseUrl: 'https://www.wanandroid.com/',
      connectTimeout: Duration(seconds: 30),
      receiveTimeout: Duration(seconds: 30),
      sendTimeout: Duration(seconds: 30)
    );
    Response response = await dio.get('banner/json');
    BannerData bannerData = BannerData.fromJson(response.data);
    return bannerData.data;
  }
}