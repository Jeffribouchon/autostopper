import 'package:flutter/material.dart';

final List<Map<String, dynamic>> listHashtag = [
  {
    'name': "#Flutter",
  },
  {
    'name': "#Dart",
  },
];

class ListHashtagView extends StatelessWidget {
  const ListHashtagView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listHashtag.isEmpty
        ? const Center(
            child: Text('No Hashtags'),
          )
        : ListView.builder(
            itemCount: listHashtag.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key(index.toString()),
                onDismissed: (direction) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('$index enregistrement supprimé')),
                  );
                },
                background: Container(
                  color: Colors.red,
                ),
                child: Card(
                  child: ListTile(
                    title: Text(listHashtag[index]['name']),
                  ),
                ),
              );
            },
          );
  }
}
