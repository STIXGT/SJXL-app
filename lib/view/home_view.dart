import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../routers/app_route.gr.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const FavoritosViewRoute());
              },
              child: const Text('inicia Sesion')),
          const Divider(
            color: Colors.transparent,
            height: 25.0,
          ),
          ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const DeliveryViewRoute());
              },
              child: const Text('inicia Sin Sesion')),
          const Divider(
            color: Colors.transparent,
            height: 25.0,
          ),
          ElevatedButton(
              onPressed: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                pref.clear();
              },
              child: const Text('Cerrar Sesion'))
        ],
      ),
    );
  }
}
