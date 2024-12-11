import 'package:flutter/material.dart';
import 'package:front/app.list/book_list_page.dart';
import 'package:front/app.list/film_list_page.dart';
import 'package:front/app.list/serie_list_page.dart';

class MainMenuPage extends StatelessWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text(
          "WELCOME TO HOBBY HALL",
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Container(
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SerieListPage()));
              },
              child: Text("serie"
            )),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FilmListPage()));
              },
              child: Text("film")
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BookListPage()));
              },
              child: Text("livre")
            ),
          ],
        ),
      ),
    );
  }
}