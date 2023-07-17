import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../routers/app_route.gr.dart';

@RoutePage()
class DeliveryView extends StatelessWidget {
  const DeliveryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        const Divider(
          color: Colors.transparent,
          height: 18.0,
        ),
        ElevatedButton(
            onPressed: () {
              AutoRouter.of(context).push(const HomeViewRoute());
            },
            child: const Text('Regresa al Home')),
        const Divider(
          color: Colors.transparent,
          height: 18.0,
        ),
      ],
    ));
  }
}
