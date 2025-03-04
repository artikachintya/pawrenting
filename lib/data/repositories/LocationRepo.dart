import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';

class LocationRepo extends GetxController {
  static LocationRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  /// Add a new location to the user's document in Firestore
  Future<void> addLocation(String email, LocationModel newLocation) async {
    DocumentReference userRef = _db.collection('users').doc(email);

    try {
      // 🔍 Debugging: Check if user document exists
      DocumentSnapshot userSnapshot = await userRef.get();
      List<dynamic> existingLocations = [];

      if (userSnapshot.exists && userSnapshot.data() != null) {
        // 🔍 Debugging: Print existing data
        print("User document exists. Retrieving locations...");
        existingLocations = userSnapshot.get('locations') ?? [];
      } else {
        print("User document does not exist. Creating new user document...");
      }

      // ✅ Append new location
      existingLocations.add(newLocation.toJson());

      // ✅ Update Firestore with the modified list
      await userRef
          .set({'locations': existingLocations}, SetOptions(merge: true));

      print("✅ Location added successfully!");
    } catch (e) {
      print("❌ Error adding location: $e");
    }
  }

  /// Get all locations for a user
  Future<List<LocationModel>> getUserLocations(String email) async {
    try {
      print('sini');
      DocumentSnapshot userSnapshot = await _db
          .collection('users')
          .where('email', isEqualTo: email)
          .limit(1) // Limit to 1 document since emails are unique
          .get()
          .then((querySnapshot) => querySnapshot.docs.isNotEmpty
              ? querySnapshot.docs.first
              : null as DocumentSnapshot<Object?>);

      if (userSnapshot.exists) {
        print('user snapshot exist');
        List<dynamic> locationData = userSnapshot.get('locations') ?? [];
        return locationData.map((loc) => LocationModel.fromJson(loc)).toList();
      }
    } catch (e) {
      print("Error fetching locations: $e");
    }
    print('kosong cuy');
    return [];
  }

  /// Remove a location by index
  Future<void> removeLocation(String email, int index) async {
    DocumentReference userRef = _db.collection('users').doc(email);

    try {
      DocumentSnapshot userSnapshot = await userRef.get();

      List<dynamic> existingLocations =
          userSnapshot.exists ? userSnapshot.get('locations') ?? [] : [];

      if (index >= 0 && index < existingLocations.length) {
        existingLocations.removeAt(index);
        await userRef.update({'locations': existingLocations});
        print("Location removed successfully!");
      }
    } catch (e) {
      print("Error removing location: $e");
    }
  }

  /// Get all locations from the 'Locations' collection
  Future<List<LocationModel>> getAllLocations() async {
    final snapshot = await _db.collection('locations').get();
    print("Fetched ${snapshot.docs.length} locations"); // Debugging
    return snapshot.docs.map((e) {
      print("Location Data: ${e.data()}"); // Debugging
      return LocationModel.fromJson(e.data() as Map<String, dynamic>);
    }).toList();
  }
}
