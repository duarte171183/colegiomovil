 import 'dart:convert';
 import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
 import 'package:flutter/material.dart';
 import 'dart:async';
 

 final  String _apiUrl = "http://192.168.1.71:3000/guides";

class BottomBar extends StatefulWidget{
  @override
    _BottomBarState createState () => _BottomBarState();
  }
  
  class _BottomBarState extends State<BottomBar> {

    int _currentIndex = 0;

    final List<Widget>_children =[
      Home(),
      Buscar(),
      Chats(),
    ];
    
    void switchTabs(int index){
      setState(() {
       _currentIndex = index;
      });
    }
    
    @override
    Widget build(BuildContext context)  {
           
      return Scaffold(
        appBar: AppBar(
          title: Text("Necesito un Guia", 
          style: TextStyle(fontSize: 30.0),
          ),
        ),
        
        body: _children[_currentIndex],

        bottomNavigationBar: BottomNavigationBar(
          onTap: switchTabs,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("home"),
              backgroundColor: _currentIndex != 1 ?  Colors.white : Colors.blue
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("buscar"),
              backgroundColor: _currentIndex != 2 ?  Colors.white : Colors.blue
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text("Chats"),
              backgroundColor: _currentIndex != 3 ?  Colors.white : Colors.blue
            )
          ]
        ),
      );
    }
  }


  class Home extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
  }

  class _HomeState extends State<Home> {

  Future<List<Guide>> _getGuides() async {
    
    var data = await http.get(_apiUrl);

    var jsonData = json.decode(data.body);

    List<Guide> guides = [];

    for(var g in jsonData){
      Guide guide = Guide(g["email"],g["name"], g["detail"]["picture"]["url"], g["detail"]["about"] );
      guides.add(guide);
    }

    print(guides.length);
    return guides;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("./images/background.jpg", fit: BoxFit.cover),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
             child: FutureBuilder(
               future: _getGuides(),
               builder: (BuildContext context, AsyncSnapshot snapshot){
                 if(snapshot.data == null){
                   return Container(
                     child: Text("Loading..."),
                     color: Colors.white,
                   );
                 }
                 else{
                   return ListView.builder(
                     padding: const EdgeInsets.all(12.0),
                     itemCount: snapshot.data.length,
                     itemBuilder: (BuildContext context, int index){
                     return 
                       Card(
                         shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           children: <Widget>[
                             ListTile(
                               leading: CachedNetworkImage(
                                imageUrl:  "http://192.168.1.71:3000"+snapshot.data[index].url,
                                placeholder: (context, url) => CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
                              title: Text(snapshot.data[index].name),
                              subtitle: Text(snapshot.data[index].about),
                             )
                           ],
                           
                         ),
                         
                      );
                   },
                   );
                }
              }
             ), 
            )
          )
          
        ],
      ),
    );
  }

  }

  class Buscar extends StatelessWidget {
    @override
    Widget build (BuildContext context){
      return Text("buscar");
    }
  }

  class Chats extends StatelessWidget {
    @override
    Widget build (BuildContext context){
      return Text("Chats");
    }
  }

 class Guide {
  final  String email;
  final String name;
  final String url;
  final String about;
  Guide(this.email, this.name, this.url, this.about);
 }

 class Detail{
   final List<Picture> picture;
   final String about;
   Detail(this.picture, this.about);
 }

 class Picture{
   final String url;
   Picture(this.url);
 }