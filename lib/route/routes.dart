import 'package:first_demo/main.dart';
import 'package:first_demo/page5.dart';
import 'package:first_demo/page5_child.dart';
import 'package:flutter/material.dart';

class RoutePath{
  static const String home = '/';
  static const String page5 = '/page5';
  static const String page5Child = '/page5Child';
}

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(Home(), settings: settings);
      case RoutePath.page5:
        return pageRoute(Page5(), settings: settings);
      case RoutePath.page5Child:
        return pageRoute(Page5Child(), settings: settings);
    }
    return pageRoute(SafeArea(child: Container(child: Text('${settings.name} not exist'),)));
  }

  static MaterialPageRoute pageRoute(Widget page, {
    RouteSettings? settings,
    bool? maintainState,
    bool? fullscreenDialog,
    bool? allowSnapshotting,
    bool? barrierDismissible
  }){
    return MaterialPageRoute(
      builder: (builder)=>page,
      settings: settings,
      maintainState: maintainState ?? true,
      fullscreenDialog: fullscreenDialog ?? true,
      allowSnapshotting: allowSnapshotting ?? true,
      barrierDismissible: barrierDismissible ?? false
    );
  }
}