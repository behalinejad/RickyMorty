import 'package:flutter/material.dart';
import 'package:rick_and_morty/ui/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Rick and Morty',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.black,
        //scaffoldBackgroundColor : Color.fromRGBO(23, 23, 23, 0.8),
       // accentColor: Colors.black12,
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 50 , fontWeight: FontWeight.bold,color: Colors.white),
          headline2: TextStyle(fontSize: 30 , fontWeight: FontWeight.w700,color: Colors.white  ,),
          headline3: TextStyle(fontSize: 24.0 ,color: Colors.white),
          bodyText2: TextStyle(fontSize: 16.0 ,fontWeight: FontWeight.w500,color: Colors.white ,),
          bodyText1: TextStyle(fontSize: 12.0 ,fontWeight: FontWeight.w200,color: Colors.white ,),
          caption: TextStyle(fontSize: 11.0 ,fontWeight: FontWeight.w100,color: Colors.grey ,),
        ),
      ),
      home: MyHomePage(title: 'Rick and Morty'),
    );
  }
}


