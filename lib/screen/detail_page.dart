import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerWidget {
  final character;
  const DetailPage({super.key, required this.character});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text(
          character.name,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(character.image),
            ),
            SizedBox(height: 10),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              color: Colors.blue.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                character.name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              color: Colors.blue.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                character.status.toString().split('.').last,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              color: Colors.blue.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                character.gender.toString().split('.').last,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              color: Colors.blue.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                character.origin.name.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              color: Colors.blue.shade100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                character.location.name.toString(),
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
