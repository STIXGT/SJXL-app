import 'package:hdt_flutter/routers/app_route.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:hdt_flutter/routers/guard/auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route,View')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeViewRoute.page, initial: true),
        AutoRoute(page: LoginViewRoute.page),
        AutoRoute(page: RegisterViewRoute.page),
        AutoRoute(page: BuscarViewRoute.page),
        AutoRoute(page: DeliveryViewRoute.page),
        AutoRoute(page: FavoritosViewRoute.page, guards: [AuthGuard()]),
      ];
}
