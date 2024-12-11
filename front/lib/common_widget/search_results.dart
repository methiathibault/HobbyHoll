import 'package:flutter/material.dart';
import 'package:front/app.detail/detail_page.dart';

class SearchResults extends StatelessWidget {
  final List<dynamic> results;
  final bool isLoading;
  final String? error;

  const SearchResults({
    super.key,
    required this.results,
    required this.isLoading,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return Center(child: Text(error!, style: const TextStyle(color: Colors.red)));
    }

    if (results.isEmpty) {
      return const Center(child: Text('No results found'));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final hobby = results[index];
        return ListTile(
          title: Text(hobby['name']),
          subtitle: Text(hobby['type']),
          trailing: Text('Rating: ${hobby['rating']}'),
          onTap: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) =>
                 DetailPage(id: hobby['id'],)
              ),
            );
          },
        );
      },
    );
  }
}