import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hdt_flutter/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routers/app_route.gr.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  final Function(bool?) onResult;
  const LoginView({super.key, required this.onResult});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  _login() async {
    String email = _email.text.trim();
    String password = _password.text.trim();
    bool loginSuccess = await ApiService().loginPost(email, password);
    if (loginSuccess) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setBool('logged_in', true);
      //
      widget.onResult.call(true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Wrong username or password'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Column(
        children: <Widget>[
          TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Escribir el correo",
                labelText: "Email: ",
                border: OutlineInputBorder(),
              )),
          const Divider(
            color: Colors.transparent,
            height: 18.0,
          ),
          TextFormField(
            controller: _password,
            decoration: const InputDecoration(
              icon: Icon(Icons.lock),
              hintText: "Escribir la contraseña",
              labelText: "Contraseña:",
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const Divider(
            color: Colors.transparent,
            height: 18.0,
          ),
          ElevatedButton(
              onPressed: () {
                _login();
              },
              child: const Text('Iniciar sesion')),
          const Divider(
            color: Colors.transparent,
            height: 18.0,
          ),
          ElevatedButton(
              onPressed: () {
                AutoRouter.of(context).push(const RegisterViewRoute());
              },
              child: const Text('Registrarse')),
        ],
      )),
    );
  }
}
