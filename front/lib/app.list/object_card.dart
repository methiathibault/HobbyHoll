import 'package:flutter/material.dart';

class ObjectCard extends StatelessWidget {
  const ObjectCard({
    super.key,
    required this.onPressed,
    });

    final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
     
      child: ElevatedButton(onPressed: onPressed,
      child: const Text(
        "nom du livre",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        )
      ),
    );
  }
}