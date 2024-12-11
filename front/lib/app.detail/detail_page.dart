import 'package:flutter/material.dart';
import 'package:front/app.api/hobby.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.id,
    });
    final int id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Future<dynamic> _objects;
  @override

  void initState(){
    super.initState();
    _objects = Hobby.getHobby(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: FutureBuilder(
        future: _objects,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("images/book.jpg"),
              Text("TITRE: ${snapshot.data!["name"]}"),
              Text("TYPE: ${snapshot.data!["type"]}"),
              Text("NOTE : ${snapshot.data!["rating"]}"),
              Text("DESCRIPTION : ${snapshot.data!["description"]}"),
              Text("DATE DE SORTIE : ${DateTime.parse(snapshot.data!["release_date"]).toString().split(' ')[0]}"),
            ],
          );
          } else {
            return const Center(child: Text("Pas de data"));
          }
        }
       )
    );
  }
}