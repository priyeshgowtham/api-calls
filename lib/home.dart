import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_application_13/user_model.dart';
import 'package:http/http.dart' as http;



class OldApp extends StatelessWidget {
  const OldApp({Key? key}) : super(key: key);

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
	home: new New()
	);
}
}
class New extends StatefulWidget {
  @override
  State<New> createState() => _NewState();
}

class _NewState extends State<New> {
    final _texttitle = TextEditingController();
    final _textsubtitle = TextEditingController();
bool clicked=false;
List title = ['Buy food for da kitty','Find a Red Sea dive trip','Book flights to Egypt','Decide on accommodation']; 
List subtitle = ['with the chickeny bits!','Echo vs My Dream','with the chickeny bits!','Echo vs My Dream']; 
List<User> userModel=[];

  Object? get result => null;
Future fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200) {
    var r=await jsonDecode(response.body);
        userModel=await r.map<User>((json)=>User.fromJson(json)).toList();

    setState(() {
      this.userModel=userModel;
      
    });
    print('priyesh$userModel');
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return userModel;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}




  static get numbers => null;

  get cancelButton => null;

  get continueButton => null;

  int? get index => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     title.add(_texttitle.text);
            subtitle.add(_textsubtitle.text);
    fetchAlbum();
  }

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		title:Text("Vanilla Example"),
    backgroundColor: Colors.black45,
	),
	body: Container(height: MediaQuery.of(context).size.height,
	  child: ListView.builder(
	  	itemCount: userModel.length,
	  	itemBuilder:
    
     (BuildContext context,int index){
	  	var product;
	  	return Dismissible(key: Key('item ${userModel[index]}'),
     onDismissed: (DismissDirection direction) {
          if (direction == DismissDirection.startToEnd) {
            print("Add to favorite");
          } else {
            print('Remove item');
          }
 
          setState(() {
            userModel.removeAt(index);
            
          });
        },
          child: Container(
            height: 50,
            child: ListTile(
        
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
                trailing: Container(width: 320,
                  
                  child: Text(userModel[index].title.toString())),
              title:Container(
              
    
                
                child: Image.network(userModel[index].thumbnailUrl.toString(),scale: 5,)),
              ),
          ),
        );  
	  	}
	  	),
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
                  padding: const EdgeInsets.symmetric(vertical: 100,horizontal: 20),
                  child: AlertDialog( 
                    content:Column(
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
  ),cursorHeight: 40,
),]),
    
                    actions: <Widget>[
                     ElevatedButton(
  child: Text('Button'),
  onPressed: () { Navigator.of(context, rootNavigator: true).pop(result);
 setState(() {
            title.add(_texttitle.text);
            subtitle.add(_textsubtitle.text);
            
          });
  },
),
                    ],
                  ),
                ),
              );
         
        },
      ), ); 	
}

  void showLoading() {}

  void hideLoading() {}

  getAllUserModelFromApi() {}

}
// TODO Implement this library.