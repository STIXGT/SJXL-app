import 'package:auto_route/auto_route.dart';
import 'package:hdt_flutter/routers/app_route.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool loggedIn = pref.getBool('logged:_in') ?? false;
    if (loggedIn) {
      resolver.next(true);
    } else {
      router.push(LoginViewRoute(onResult: (result) {
        if (result == true) {
          resolver.next(true);
          router.removeLast();
        }
      }));
    }
  }
}
