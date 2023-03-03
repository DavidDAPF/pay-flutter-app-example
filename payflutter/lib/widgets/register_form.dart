import 'package:flutter/material.dart';
import 'package:payflutter/widgets/dialogs.dart';
import 'package:payflutter/widgets/input_widget.dart';

import '../api/autentication_api.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formkey = GlobalKey();
  String _email = '';
  String _password = '';
  String _username = '';
  final AuthenticationAPI _authenticationAPI = AuthenticationAPI();

  Future<void> _submit() async {
    final isOk = _formkey.currentState!.validate();
    print('form isOk $isOk');
    if (isOk) {
      ProgressDialog.show(context);
      await _authenticationAPI.register(
        username: _username,
        email: _email,
        password: _password,
      );
      ProgressDialog.dissmiss(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          InputText(
            keyboardType: TextInputType.text,
            label: 'Ingrese su nombre',
            onChanged: (text) {
              _username = text;
            },
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Ingrese un nombre valido';
              }
              return null;
            },
          ),

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
            child: const Text('Registrarse'),
          ),
          const SizedBox(height: 10),

          // Boton y texto de registro
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text('Ya tienes una cuenta?'),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Login',
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
