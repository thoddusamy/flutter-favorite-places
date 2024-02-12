import 'package:fav_places/providers/places_list_provider.dart';
import 'package:fav_places/screens/place_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesList extends ConsumerWidget {
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placesList = ref.watch(placeListProvider);
    if (placesList.isEmpty) {
      return const Center(
        child: Text('No places added yet.'),
      );
    }
    return ListView.builder(
      itemCount: placesList.length,
      itemBuilder: (context, i) => ListTile(
        leading: CircleAvatar(
          backgroundImage: FileImage(placesList[i].image),
        ),
        title: Text(placesList[i].title),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (ctx) => PlaceDetailsScreen(place: placesList[i])),
          );
        },
      ),
    );
  }
}
