import 'package:flutter/material.dart';

import 'bottom.dart';

void main() => runApp(BotApp());
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

// This widget is the root
// of your application.
@override
Widget build(BuildContext context) {
	return new MaterialApp(
	title: "ListView.builder",
	theme: new ThemeData(
		primarySwatch: Colors.green
	),
	debugShowCheckedModeBanner: false,
	home: new ListViewBuilder()
	);
}
}
class ListViewBuilder extends StatefulWidget {
  @override
  State<ListViewBuilder> createState() => _ListViewBuilderState();
}

class _ListViewBuilderState extends State<ListViewBuilder> {
   final _texttitle = TextEditingController();
    final _textsubtitle = TextEditingController();
bool clicked=false;
List title = ['Buy food for da kitty','Find a Red Sea dive trip','Book flights to Egypt','Decide on accommodation']; 
List subtitle = ['with the chickeny bits!','Echo vs My Dream','with the chickeny bits!','Echo vs My Dream']; 
  

  static get numbers => null;

  get cancelButton => null;

  get continueButton => null;

  Object? get result => null;
  

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title:Text("Vanilla Example"),
    backgroundColor: Colors.black45,
	),
	body: ListView.builder(
		itemCount: title.length,
		itemBuilder:
    
     (BuildContext context,int index){
		var product;
		return Dismissible(key: Key('item ${title[index]}'),
     onDismissed: (DismissDirection direction) {
          if (direction == DismissDirection.startToEnd) {
            print("Add to favorite");
          } else {
            print('Remove item');
          }
 
          setState(() {
            title.removeAt(index);
            subtitle.removeAt(index);
            
          });
        },
          child: ListTile(
            leading:clicked? Icon(Icons.check_box):Icon(Icons.check_box_outline_blank),
              onTap: () {
                
                  if(clicked==true){
                    setState((){
                      clicked=false;
                    });
              }else{
                  setState((){
                      clicked=true;
                    });
              }},
            trailing: Text("GFG",
                  style: TextStyle(
                    color: Colors.green,fontSize: 15),),
            title:Text(title[index]),subtitle: Text(subtitle[index]),
            ),
        );  
		}
		),  floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        // isExtended: true,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.green,
        onPressed: () { 
showDialog(
                context: context,
                builder: (ctx) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 0),
                  child: AlertDialog( 
                    content:Container(
                      height: 300,
                      child: SingleChildScrollView(
                        child: Column(
                        children:  <Widget>[
                          TextField(controller: _texttitle,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a Name',
                        ),
                      ),
                          TextField(controller: _textsubtitle,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter a  Number',
                        ),cursorHeight: 50,
                      ),]),
                      ),
                    ),
    
                    actions: <Widget>[
                     ElevatedButton(
  child: Text('Button'),
  onPressed: () async{
    Navigator.of(context, rootNavigator: true).pop(result);
 setState(() {
            title.add(_texttitle.text);
            subtitle.add(_textsubtitle.text);
            
          });
  },
),
                  ],
                ),
 ) );
 
     
          
   
         
        },
      ),); 	
}

}

class _textsubtitle {
}

class _texttitle {
}    