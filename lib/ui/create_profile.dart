import 'package:flutter/material.dart';

class CreateProfile extends StatefulWidget{
  @override
  _CreatePState createState () => _CreatePState();
  }
  
  class _CreatePState extends State<CreateProfile> {

    final TextEditingController _userController = new TextEditingController();
    final TextEditingController _emailController = new TextEditingController();

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
                    controller: _userController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Escribe un nombre de usuario",
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: "Nombre de Usuario",
                    ),
                  ),

                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "you@example.com",
                      contentPadding: const EdgeInsets.all(20.0),
                      labelText: "Correo Electronico",
                    ),
                  )
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
                    child: Text("Guardar", style: TextStyle(
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
                          _userController.clear();
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