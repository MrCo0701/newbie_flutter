import 'package:flutter/material.dart';

import '../models/place.dart';

class Place_list extends StatelessWidget {
  const Place_list({super.key, required this.listPlaces});

  final List<Place> listPlaces;

  @override
  Widget build(BuildContext context) {
    if (listPlaces.isEmpty) {
      return Center(
          child: Text('no any data',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground)));
    }

    return ListView.builder(
        itemBuilder: (ctx, index) => ListTile(
              title: Text(
                listPlaces[index].title,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ));
  }
}
