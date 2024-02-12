import 'package:fav_places/screens/add_fav_place.dart';
import 'package:fav_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

class FavoritePlacsesScreen extends StatelessWidget {
  const FavoritePlacsesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Places"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddFavPlaceScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: PlacesList(),
      ),
    );
  }
}
