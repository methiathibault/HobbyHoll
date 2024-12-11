import 'package:flutter/material.dart';
import 'package:front/app.detail/detail_page.dart';
import 'package:front/app.list/object_card.dart';

class SerieListPage extends StatefulWidget {
  const SerieListPage({super.key});

  @override
  State<SerieListPage> createState() => _SerieListPageState();
}

class _SerieListPageState extends State<SerieListPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LISTE DES SERIES",
          textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        centerTitle: true,
        elevation: 2.0,
      ),

      body: Container(
        color: Colors.amber,
        child: Column(
          children: [
            const Text("barre de nav"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ObjectCard(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPage(id: 2,)));
                  },),
                  const SizedBox(height: 8.0),
                  ObjectCard(onPressed: (){},),
                  const SizedBox(height: 8.0),
                  ObjectCard(onPressed: (){},),
                  const SizedBox(height: 8.0),
                  ObjectCard(onPressed: (){},),
                  const SizedBox(height: 8.0),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}