import 'package:flutter/material.dart';
import 'package:payflutter/widgets/dashboard.dart';
import 'package:payflutter/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String password = '';
  Map<String, dynamic> users = {'name': 'renatta', 'password': 123456789};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
            color: Colors.grey[300],
            child: Container(
              padding: const EdgeInsets.all(30.0),
              child: const SingleChildScrollView(
                child: LoginForm(),
                // inicio del formulario
                // child: Form(
                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                //   key: _formKey,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: <Widget>[
                //       const Icon(
                //         Icons.payment,
                //         size: 140,
                //       ),
                //       // Nombre del usuario
                //       TextFormField(
                //         validator: (name) {
                //           if (name == null || name.isEmpty) {
                //             return 'El nombre es requerido';
                //           }
                //           return null;
                //         },
                //         decoration: const InputDecoration(
                //           icon: Icon(Icons.person),
                //           labelText: 'User Name',
                //           hintText: 'Nombre de Usuario',
                //         ),
                //         keyboardType: TextInputType.text,
                //       ),

                //       // Contrasena del usuario
                //       TextFormField(
                //         validator: (password) {
                //           if (password == null || password.isEmpty) {
                //             return 'La Contrasena es requerida';
                //           }
                //           return null;
                //         },
                //         keyboardType: TextInputType.visiblePassword,
                //         obscureText: true,
                //         decoration: const InputDecoration(
                //           icon: Icon(Icons.key),
                //           labelText: 'Password',
                //         ),
                //       ),

                //       const SizedBox(
                //         height: 40,
                //       ),
                //       TextButton(
                //         style: TextButton.styleFrom(
                //           padding: const EdgeInsets.all(15.0),
                //           foregroundColor: Colors.white,
                //           backgroundColor: Colors.lightBlue,
                //         ),
                //         onPressed: () {
                //           final isValidForm = _formKey.currentState!.validate();

                //           if (isValidForm) {
                //             Navigator.of(context).pushAndRemoveUntil(
                //               MaterialPageRoute(
                //                 builder: (context) => const Dashboard(),
                //               ),
                //               (route) => false,
                //             );
                //           }
                //         },
                //         child: const Text(
                //           'Login',
                //           style: TextStyle(fontSize: 24),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
