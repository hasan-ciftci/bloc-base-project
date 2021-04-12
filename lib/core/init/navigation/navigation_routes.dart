import 'package:bloc_base_project/core/components/route_not_found_widget.dart';
import 'package:bloc_base_project/core/constants/navigation/navigation_constants.dart';
import 'package:bloc_base_project/presentation/views/home_view.dart';
import 'package:bloc_base_project/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

class NavigationRoutes {
  static NavigationRoutes _instance = NavigationRoutes._init();

  static NavigationRoutes get instance => _instance;

  NavigationRoutes._init();

  Route<dynamic> generateRoute(args) {
    switch (args.name) {
      case NavigationConstants.LOGIN_VIEW:
        return normalNavigate(
          LoginView(),
        );
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(
          HomeView(),
        );
      default:
        return normalNavigate(
          RouteNotFoundWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
