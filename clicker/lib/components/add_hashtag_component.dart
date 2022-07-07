import 'package:flutter/material.dart';

class AddHashtagComponent extends StatelessWidget {
  const AddHashtagComponent({Key? key}) : super(key: key);

  void _modal(BuildContext context) => showModalBottomSheet(
        context: context,
        builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Nouvel Hashtag',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Saisissez votre Hashtag",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Annuler"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text("Ajouter"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _modal(context),
      tooltip: 'Ajouter',
      child: const Icon(Icons.add),
    );
  }
}
