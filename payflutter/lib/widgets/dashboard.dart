import 'package:flutter/material.dart';
import 'package:payflutter/widgets/home_page.dart';

class Dashboard extends StatelessWidget {
  static const routeName = 'dashboard';
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido: {usuario} '),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Cuenta Bancaria'),
                    content: const Text('Desea cerrar la sesion'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                          onPressed: () =>
                              Navigator.pushReplacementNamed(context, "home"),
                          child: const Text('OK')),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Center(
              child: SizedBox(
                child: Center(
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    fit: StackFit.expand,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    // overflow: Overflow.visible,
                    children: <Widget>[
                      Container(width: 300, height: 300),

                      // Data del usuario con el boton pagar cuentas
                      Positioned(
                        top: 350,
                        left: 20,
                        right: 20,
                        child: Container(
                          width: 300,
                          height: 400,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 20),
                                  child: const Text(
                                      'Cuenta Corriente:{ api.cuenta.corriente}',
                                      style: TextStyle(fontSize: 20)),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 20),
                                  child: const Text(
                                      'Cuenta de Ahorro:{ api.cuenta.ahorro}',
                                      style: TextStyle(fontSize: 20)),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 20),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 50.0),
                                    ),
                                    onPressed: null,
                                    child: const Text('Pagar Servicio'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      // texto del nombre del usuario
                      Positioned(
                        left: 20,
                        right: 20,
                        top: 300,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          height: 80,
                          width: 200,
                          // color: Colors.limeAccent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: const <Widget>[
                                  Text(
                                    'Usuario:{nombre de usuario} ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Icono del usuario
                      Positioned(
                        left: 20,
                        right: 20,
                        top: 50,
                        child: Container(
                          height: 230,
                          width: 260,
                          // color: Colors.purple,
                          //child: Icon(Icons.usb_rounded)
                          child: CircleAvatar(
                            backgroundColor: Colors.blue[50],
                            child: Icon(
                              Icons.people,
                              size: 40,
                            ),
                          ),
                        ),
                      ), //Container
                    ], //<Widget>[]
                  ), //Stack
                ), //Center
              ), //SizedBox
            ); //Center
          },
          itemCount: 1),
    );
  }
}
