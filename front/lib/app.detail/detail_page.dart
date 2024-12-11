import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    required this.id,
    });
    final double id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("images/book.jpg"),
          Text("TITRE: "),
          Text("TYPE: "),
          Text("NOTE : "),
          Text("DESCRIPTION : "),
        ],
      ),
    );
  }
}