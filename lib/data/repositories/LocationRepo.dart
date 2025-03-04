import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pawrentingreborn/features/profile/models/LocationModel.dart';

class LocationRepo extends GetxController {
  static LocationRepo get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> addLocation(LocationModel newLocation) async {
    User? currentUser = firebaseAuth.currentUser;
    if (currentUser == null) {
      print("No user is currently signed in.");
      return;
    }

    String email = currentUser.email!;
    CollectionReference usersRef = _db.collection('users');

    try {
      // Step 1: Find the correct user document by email
      QuerySnapshot querySnapshot =
          await usersRef.where('email', isEqualTo: email).get();

      if (querySnapshot.docs.isEmpty) {
        print("User document not found!");
        return;
      }

      // Step 2: Get the correct document ID
      String docID = querySnapshot.docs.first.id;
      DocumentReference userRef = usersRef.doc(docID);

      // Step 3: Update the locations array
      await userRef.update({
        'locations': FieldValue.arrayUnion([newLocation.toJson()])
      });

      print("Location added successfully!");
    } catch (error) {
      print("Failed to add location: $error");
    }
  }

  /// Get all locations for a user
  Future<List<LocationModel>> getUserLocations() async {
    User? currentUser = firebaseAuth.currentUser;
    if (currentUser == null) {
      print("No user is currently signed in.");
      return [];
    }
    String email = currentUser.email!;
    CollectionReference usersRef = _db.collection('users');

    try {
      QuerySnapshot querySnapshot =
          await usersRef.where('email', isEqualTo: email).get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot userSnapshot = querySnapshot.docs.first;
        List<dynamic> locations = userSnapshot.get('locations') ?? [];
        return locations.map((loc) => LocationModel.fromJson(loc)).toList();
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

  // Update a specific location inside the array by index
  Future<void> updateLocation(
      String email, int index, LocationModel updatedLocation) async {
    DocumentReference userRef = _db.collection('users').doc(email);

    try {
      DocumentSnapshot userSnapshot = await userRef.get();
      List<dynamic> locations = userSnapshot.get('locations') ?? [];

      if (index >= 0 && index < locations.length) {
        locations[index] = updatedLocation.toJson();
        await userRef.update({'locations': locations});
        print("Location updated successfully!");
      } else {
        print("Invalid location index.");
      }
    } catch (e) {
      print("Error updating location: $e");
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
}
