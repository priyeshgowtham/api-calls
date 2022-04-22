import 'package:flutter/material.dart';
import 'package:flutter_application_13/home.dart';
import 'package:flutter_application_13/main.dart';  
  
  
  
/// This Widget is the main application widget.  
class BotApp extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: MyNavigationBar (),  
    );  
  }  
}  
  
class MyNavigationBar extends StatefulWidget {  
  MyNavigationBar ({Key? key}) : super(key: key);  
  
  @override  
  _MyNavigationBarState createState() => _MyNavigationBarState();  
}  
  
class _MyNavigationBarState extends State<MyNavigationBar > {  
  int _selectedIndex = 0;  
  static const List<Widget> _widgetOptions = <Widget>[  
    MyApp(),
    OldApp() 
    
  ];  
  
  void _onItemTapped(int index) {  
   

    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
       
      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
      ),  
      bottomNavigationBar: BottomNavigationBar(  
        items: const <BottomNavigationBarItem>[  
          BottomNavigationBarItem(  
            icon: Icon(Icons.list),  
            label: "todos",
             
           
          ),  
          BottomNavigationBarItem(  
            icon: Icon(Icons.list_alt_outlined), 
            label: "Stats", 
            
            backgroundColor: Colors.black54
          ),  
        ],  
        type: BottomNavigationBarType.shifting,  
        currentIndex: _selectedIndex,  
        selectedItemColor: Colors.black,  
        iconSize: 40,  
        onTap: _onItemTapped,  
        elevation: 5   
       
      ),  
    );  
  }  
}  