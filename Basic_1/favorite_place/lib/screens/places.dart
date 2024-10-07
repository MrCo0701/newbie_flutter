import 'package:favorite_place/screens/add_place.dart';
import 'package:favorite_place/widgets/places_list.dart';
import 'package:flutter/material.dart';

class PLacesScreen extends StatelessWidget {
  const PLacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [IconButton(onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const AddPlaceScreen()));
        }, icon: const Icon(Icons.add))
        ],
      ),
      body: const Place_list(listPlaces: []),
    );
  }
}
