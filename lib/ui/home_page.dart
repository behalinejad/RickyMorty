import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/ricky_morty_bloc.dart';
import 'package:rick_and_morty/services/ricky_morty_repo.dart';
import 'package:rick_and_morty/ui/search_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title,

            style: Theme.of(context).textTheme.headline3,
          ),
      ),
      body: BlocProvider(
        create:(context) => RickyMortyBloc( RickyMortyRepo()) ,
        child: Container(

            decoration: BoxDecoration(
            color: Colors.black87
            ),
            child: SearchPage()),
      )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}