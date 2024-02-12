import 'dart:io';

import 'package:fav_places/models/place.dart';
import 'package:fav_places/providers/places_list_provider.dart';
import 'package:fav_places/widgets/image_input.dart';
import 'package:fav_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFavPlaceScreen extends ConsumerStatefulWidget {
  const AddFavPlaceScreen({super.key});

  @override
  ConsumerState<AddFavPlaceScreen> createState() => _AddFavPlaceScreenState();
}

class _AddFavPlaceScreenState extends ConsumerState<AddFavPlaceScreen> {
  var _entertedTitle;
  File? _onTookImage;
  final _formKey = GlobalKey<FormState>();

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_onTookImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Picture should be taken"),
          duration: Duration(seconds: 1),
        ));
        return;
      }
      final place = Place(title: _entertedTitle, image: _onTookImage!);
      ref.read(placeListProvider.notifier).addNewPlace(place);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new place"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Title"),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 2) {
                      return "Title must be 1 to 20 character";
                    }
                    return null;
                  },
                  onSaved: (newValue) => _entertedTitle = newValue,
                ),
                const SizedBox(height: 15),
                ImageInput(pickedImage: (image) => _onTookImage = image),
                const SizedBox(height: 15),
                const LocationInput(),
                const SizedBox(height: 15),
                ElevatedButton.icon(
                    onPressed: _handleSave,
                    icon: const Icon(Icons.add),
                    label: const Text("Add place"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
