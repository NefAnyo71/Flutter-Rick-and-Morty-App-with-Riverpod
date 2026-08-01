import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rickandmortyapp/providers/character_provider.dart';
import 'package:rickandmortyapp/screen/detail_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(characterProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade300,
        title: Text(
          'Rick and Morty App',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: value.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.results.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPage(
                      character: data.results[index],
                    )),
                  );
                },
                child: Card(
                  margin: EdgeInsets.all(10),
                  elevation: 8,
                  color: Colors.blue.shade100,
                  child: ListTile(
                    trailing: Icon(Icons.arrow_forward),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data.results[index].image),
                    ),
                    title: Text(
                      data.results[index].name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      data.results[index].status.toString().split('.').last,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) => Text('error'),
        loading: () => CircularProgressIndicator(),
      ),
    );
  }
}
