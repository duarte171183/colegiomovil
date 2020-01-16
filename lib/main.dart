import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './ui/create_profile.dart';
import './ui/bottom_bar.dart';

void main(){
  runApp(
      new MaterialApp(
      home: new HomeScreen(),
      debugShowCheckedModeBanner: false,
    )
  );
}

class HomeScreen extends StatelessWidget{
  
  Widget build(BuildContext context){
    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarIconBrightness: Brightness.light
    ));
    
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Image.asset(
            'images/background.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),

          Container(
            alignment: Alignment.topCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(padding: EdgeInsets.all(35.0),),
                Text(
                  "Colegio de \n Guias Turisticos\n en Chiapas",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36.0, fontWeight: FontWeight.w500,
                    fontFamily: 'Dildo',
                    color: Colors.black87
                  ),
                ),

                Padding(padding: EdgeInsets.all(60.0),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    
                    OutlineButton(
                      child: Text ("Inicia Sesion", style: TextStyle(color: Colors.white60, fontSize: 20.0),),
                      padding: const EdgeInsets.all(5.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      highlightedBorderColor: Colors.blue,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateProfile()));
                      }
                    ),

                    OutlineButton(
                      child: Text ("Registrate", style: TextStyle(color: Colors.white60, fontSize: 20.0),),
                      padding: const EdgeInsets.all(5.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      highlightedBorderColor: Colors.blue,
                      onPressed: () => debugPrint("Registrate pressed"),
                    )
                  ],
                ),

                Padding(padding: EdgeInsets.all(60.0),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    OutlineButton(
                      child: Text ("Salta registro", style: TextStyle(color: Colors.white60, fontSize: 20.0),),
                      padding: const EdgeInsets.all(5.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      highlightedBorderColor: Colors.blue,
                       onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar()));
                      }
                    )
                  ]
                )

              ],
            ),
          )
        ],
      ),
    );   
  }
}