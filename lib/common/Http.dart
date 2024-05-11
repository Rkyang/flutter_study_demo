import 'dart:collection';

import 'package:dio/dio.dart';

class MyHttp{
  static void getHttp()async{
    Dio dio = Dio();
    Response response = await dio.get('http://172.26.82.187:8081/pokemonFight/byOpponent/水');
    print(response.data.toString());
  }

  static void postHttp()async{
    Dio dio = Dio();
    Map<String, String> params = HashMap();
    params.putIfAbsent('attacker', () => "水");
    params.putIfAbsent('opponent', () => "火");
    Response response = await dio.post('http://172.26.82.187:8081/pokemonFight/postTest', queryParameters: params);
    print(response.data.toString());
  }
}