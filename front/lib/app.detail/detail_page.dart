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
        title: FutureBuilder(
          future: _objects,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!["name"]);
            }
            return const Text('Detail Page');
          },
        ),
        elevation: 0,
      ),
      body: FutureBuilder(
        future: _objects,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (!snapshot.hasData) {
            return const Center(
              child: Text(
                "No data available",
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/book.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!["name"],
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Chip(
                                label: Text(snapshot.data!["type"]),
                                backgroundColor: Theme.of(context).primaryColorLight,
                              ),
                              const SizedBox(width: 8),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber),
                                  Text(
                                    " ${snapshot.data!["rating"].toString()}",
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Description',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            snapshot.data!["description"],
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                "Release date: ${DateTime.parse(snapshot.data!["release_date"]).toString().split(' ')[0]}",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}