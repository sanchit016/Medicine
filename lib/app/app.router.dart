// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i8;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i10;
import 'package:vigorus/file_exporter.dart' as _i9;
import 'package:vigorus/ui/views/account/account_view.dart' as _i6;
import 'package:vigorus/ui/views/add_med/add_med_view.dart' as _i7;
import 'package:vigorus/ui/views/authentication/authentication_view.dart'
    as _i3;
import 'package:vigorus/ui/views/bottom_nav/bottom_nav_view.dart' as _i4;
import 'package:vigorus/ui/views/home/home_view.dart' as _i5;
import 'package:vigorus/ui/views/splash/splash_view.dart' as _i2;

class Routes {
  static const splashView = '/';

  static const authenticationView = '/authentication-view';

  static const bottomNavView = '/bottom-nav-view';

  static const homeView = '/home-view';

  static const accountView = '/account-view';

  static const addMedView = '/add-med-view';

  static const all = <String>{
    splashView,
    authenticationView,
    bottomNavView,
    homeView,
    accountView,
    addMedView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashView,
      page: _i2.SplashView,
    ),
    _i1.RouteDef(
      Routes.authenticationView,
      page: _i3.AuthenticationView,
    ),
    _i1.RouteDef(
      Routes.bottomNavView,
      page: _i4.BottomNavView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i5.HomeView,
    ),
    _i1.RouteDef(
      Routes.accountView,
      page: _i6.AccountView,
    ),
    _i1.RouteDef(
      Routes.addMedView,
      page: _i7.AddMedView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashView(),
        settings: data,
      );
    },
    _i3.AuthenticationView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.AuthenticationView(),
        settings: data,
      );
    },
    _i4.BottomNavView: (data) {
      final args = data.getArgs<BottomNavViewArguments>(nullOk: false);
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => _i4.BottomNavView(page: args.page, key: args.key),
        settings: data,
      );
    },
    _i5.HomeView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.HomeView(),
        settings: data,
      );
    },
    _i6.AccountView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.AccountView(),
        settings: data,
      );
    },
    _i7.AddMedView: (data) {
      return _i8.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.AddMedView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class BottomNavViewArguments {
  const BottomNavViewArguments({
    required this.page,
    this.key,
  });

  final int page;

  final _i9.Key? key;

  @override
  String toString() {
    return '{"page": "$page", "key": "$key"}';
  }

  @override
  bool operator ==(covariant BottomNavViewArguments other) {
    if (identical(this, other)) return true;
    return other.page == page && other.key == key;
  }

  @override
  int get hashCode {
    return page.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i10.NavigationService {
  Future<dynamic> navigateToSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAuthenticationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.authenticationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomNavView({
    required int page,
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.bottomNavView,
        arguments: BottomNavViewArguments(page: page, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToAddMedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.addMedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAuthenticationView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.authenticationView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomNavView({
    required int page,
    _i9.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.bottomNavView,
        arguments: BottomNavViewArguments(page: page, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAccountView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.accountView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithAddMedView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.addMedView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
