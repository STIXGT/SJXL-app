import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hdt_flutter/routers/app_route.gr.dart';

@RoutePage()
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 243, 239),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Divider(
                color: Colors.transparent,
                height: 100.0,
              ),
              Image(
                image: AssetImage("assets/logo.png"),
                width: 250,
              ),
              Divider(
                color: Colors.transparent,
                height: 25.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: RegisterForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => RegisterFormState();
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "Escriba algo",
                    labelText: "Nombres: ",
                    border: OutlineInputBorder(),
                  ),
                  validator: (valueName) {
                    if (valueName!.isEmpty) {
                      return 'Ingrese sus nombres completos';
                    } else {
                      return null;
                    }
                  }),
              const Divider(
                color: Colors.transparent,
                height: 18.0,
              ),
              TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.last_page),
                    hintText: "Escriba algo",
                    labelText: "Apellidos:",
                    border: OutlineInputBorder(),
                  ),
                  validator: (valueLastName) {
                    if (valueLastName!.isEmpty) {
                      return 'Ingrese sus apellidos completos';
                    } else {
                      return null;
                    }
                  }),
              const Divider(
                color: Colors.transparent,
                height: 18.0,
              ),
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Escriba algo",
                    labelText: "Email:",
                    border: OutlineInputBorder(),
                  ),
                  validator: (valueEmail) {
                    if (valueEmail!.isEmpty) {
                      return 'Ingrese un email';
                    } else {
                      return null;
                    }
                  }),
              const Divider(
                color: Colors.transparent,
                height: 18.0,
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: "Escriba algo",
                    labelText: "Teléfono:",
                    border: OutlineInputBorder(),
                  ),
                  validator: (valueCell) {
                    if (valueCell!.isEmpty) {
                      return 'Ingrese número telefónico';
                    } else if (valueCell.length < 10) {
                      return 'Ingrese 10 dígitos';
                    } else {
                      return null;
                    }
                  }),
              const Divider(
                color: Colors.transparent,
                height: 18.0,
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.menu_book_outlined),
                    hintText: "Escriba algo",
                    labelText: "Cédula:",
                    border: OutlineInputBorder(),
                  ),
                  validator: (valueCed) {
                    if (valueCed!.isEmpty) {
                      return 'Ingrese su cédula';
                    } else if (valueCed.length < 10) {
                      return 'Ingrese 10 dígitos';
                    } else if (valueCed.length > 10) {
                      return 'Máximo 10 dígitos';
                    } else {
                      return null;
                    }
                  }),
              const Divider(
                color: Colors.transparent,
                height: 25.0,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AutoRouter.of(context).push(const FavoritosViewRoute());
                    }
                  },
                  child: const Text('Terminar Registro'))
            ]));
  }
}
