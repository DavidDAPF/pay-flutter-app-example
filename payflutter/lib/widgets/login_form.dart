import 'package:flutter/material.dart';
import 'package:payflutter/widgets/input_widget.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formkey = GlobalKey();
  String _email = '';
  String _password = '';
  _submit() {
    final isOk = _formkey.currentState!.validate();
    print('form isOk $isOk');
    if (isOk) {
      // TODO: para consumo de la api
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          InputText(
            keyboardType: TextInputType.emailAddress,
            label: 'Ingrese su email',
            onChanged: (text) {
              _email = text;
            },
            validator: (text) {
              if (text == null || !text.contains('@')) {
                return 'Email invalido';
              }
              return null;
            },
          ),
          InputText(
            label: 'Password',
            obscureText: true,
            onChanged: (text) {
              _password = text;
            },
            validator: (text) {
              if (text == null || text.isEmpty) {
                return "Contrasena Invalida";
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            ),
            onPressed: _submit,
            child: const Text('Login'),
          ),
          const SizedBox(height: 10),

          // Boton y texto de registro
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Eres Nuevo?'),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'register');
                },
                child: const Text(
                  'Registrese',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
