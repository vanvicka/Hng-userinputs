import 'package:flutter/material.dart';
import 'package:hng_userinputs/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: ' HNG'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _userInputController = TextEditingController();
displayDialog(BuildContext context,){
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context){
          return AlertDialog(shape: RoundedRectangleBorder(borderRadius: BorderRadius.horizontal(right: Radius.circular(30.0),left: Radius.circular(30.0))),
            backgroundColor: Colors.blueAccent[100] ,
            title: Text("Nice", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold,),),
            content: Text(_userInputController.text, style: TextStyle(fontSize:18.0,fontStyle: FontStyle.italic),),
            actions: <Widget>[
              FlatButton(
                  onPressed:() =>Navigator.of(context).pop(),
                  child: Text("Okay"),color: Colors.blue[500],)
            ],
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox( height: 150,),
            TextFormField(
              decoration: textInputDecoration.copyWith(
                hintText: 'Enter Anything you like',
              ),
              controller: _userInputController,
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              validator: (value) => value == null? 'Email is required.': null,
            ),
            SizedBox( height: 50,),

            MaterialButton(
              height: 55,
              minWidth: 270,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)),
              child: Text(
                'Display',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              onPressed: () {
                displayDialog(context);           

             },
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
