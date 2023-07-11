// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:hdt_flutter/view/buscar_view.dart' as _i2;
import 'package:hdt_flutter/view/delivery_view.dart' as _i5;
import 'package:hdt_flutter/view/favoritos_view.dart' as _i1;
import 'package:hdt_flutter/view/home_view.dart' as _i3;
import 'package:hdt_flutter/view/login_view.dart' as _i6;
import 'package:hdt_flutter/view/register_view.dart' as _i4;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    FavoritosViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.FavoritosView(),
      );
    },
    BuscarViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.BuscarView(),
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
      );
    },
    RegisterViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RegisterView(),
      );
    },
    DeliveryViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.DeliveryView(),
      );
    },
    LoginViewRoute.name: (routeData) {
      final args = routeData.argsAs<LoginViewRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.LoginView(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.FavoritosView]
class FavoritosViewRoute extends _i7.PageRouteInfo<void> {
  const FavoritosViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          FavoritosViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritosViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BuscarView]
class BuscarViewRoute extends _i7.PageRouteInfo<void> {
  const BuscarViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          BuscarViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'BuscarViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i7.PageRouteInfo<void> {
  const HomeViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RegisterView]
class RegisterViewRoute extends _i7.PageRouteInfo<void> {
  const RegisterViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RegisterViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.DeliveryView]
class DeliveryViewRoute extends _i7.PageRouteInfo<void> {
  const DeliveryViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DeliveryViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'DeliveryViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginView]
class LoginViewRoute extends _i7.PageRouteInfo<LoginViewRouteArgs> {
  LoginViewRoute({
    _i8.Key? key,
    required dynamic Function(bool?) onResult,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          LoginViewRoute.name,
          args: LoginViewRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginViewRoute';

  static const _i7.PageInfo<LoginViewRouteArgs> page =
      _i7.PageInfo<LoginViewRouteArgs>(name);
}

class LoginViewRouteArgs {
  const LoginViewRouteArgs({
    this.key,
    required this.onResult,
  });

  final _i8.Key? key;

  final dynamic Function(bool?) onResult;

  @override
  String toString() {
    return 'LoginViewRouteArgs{key: $key, onResult: $onResult}';
  }
}
