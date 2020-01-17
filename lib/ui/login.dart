import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  @override
  _CreatePState createState () => _CreatePState();
  }
  
  class _CreatePState extends State<Login> {

    final TextEditingController _emailController = new TextEditingController();
    final TextEditingController _passwordController = new TextEditingController();

    @override
    Widget build (BuildContext context){
      return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Crea un perfil"),
          backgroundColor: Colors.greenAccent,
        ),

        body: Stack(
          children: <Widget>[
            Form(
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "you@example.com",
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: "Correo Electronico",
                    ),
                  ),
                   TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                       hintText: "password",
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: 'Password',
                    ),
                  ),
                 
                ],
              ),
            ),

            Positioned(
              left: 5.0,
              right: 5.0,
              bottom: 80.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  
                  RaisedButton(
                    child: Text("Iniciar Sesion", style: TextStyle(
                      color: Colors.white, fontSize: 20.0
                      ),), 
                      padding: EdgeInsets.all(5.0),
                      color: Colors.greenAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () => debugPrint("guardar pressed"),
                  ),

                   RaisedButton(
                    child: Text("Limpiar", style: TextStyle(
                      color: Colors.white, fontSize: 20.0
                      ),), 
                      padding: EdgeInsets.all(5.0),
                      color: Colors.redAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      onPressed: (){
                        setState(() {
                          _emailController.clear();
                        });
                      }
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
}