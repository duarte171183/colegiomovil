 import 'package:flutter/material.dart';

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
          title: Text("Guias Turisticos", 
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


  class Home extends StatelessWidget {
    @override
    Widget build (BuildContext context){
      return Text("home");
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