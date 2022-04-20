import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_13/user_model.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

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
List<UserModel> userModel=[];
Future<UserModel> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    var r=await jsonDecode(response.body);
    userModel=await r.map<UserModel>((json)=>UserModel.fromJson(json)).toList();
    print('priyesh$userModel');
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return UserModel.fromJson(jsonDecode(response.body));
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
            trailing: Text(userModel[index].id.toString(),
                  style: TextStyle(
                    color: Colors.green,fontSize: 15),),
            title:Text(userModel[index].name.toString()),subtitle: Text(userModel[index].username.toString()),
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
  onPressed: () {
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
      ), bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.black54,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.list),
        label: 'todos',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.chair),
        label: 'stats',
      ),]
  )); 	
}

  void showLoading() {}

  void hideLoading() {}

  getAllUserModelFromApi() {}

}
