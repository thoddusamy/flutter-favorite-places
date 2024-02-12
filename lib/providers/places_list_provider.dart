import 'package:fav_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceListNotifier extends StateNotifier<List<Place>> {
  PlaceListNotifier() : super(const []);

  void addNewPlace(Place place) {
    state = [...state, place];
  }
}

final placeListProvider = StateNotifierProvider<PlaceListNotifier, List<Place>>(
    (ref) => PlaceListNotifier());
