import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routers/app_route.gr.dart';

@RoutePage()
class FavoritosView extends StatelessWidget {
  const FavoritosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          const Divider(
            color: Colors.transparent,
            height: 18.0,
          ),
          ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const DeliveryViewRoute());
              },
              child: const Text("hola"))
        ],
      )),
    );
  }
}
