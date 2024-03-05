import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_one/util/printer.dart';
import '/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> addpalceInWishlist(String idPlaces, bool isEmpty) async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({
          'wishlist': isEmpty
              ? FieldValue.arrayRemove([idPlaces])
              : FieldValue.arrayUnion([idPlaces])
        })
        .then((value) =>
            Printer.print('${isEmpty ? 'Remove' : 'Add'} in wishlist'))
        .catchError((error) => Printer.print("Failed to add user: $error"));
  }

  Future<UserModel?> getUserData() async {
    UserModel? userModel;
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (documentSnapshot.exists) {
        userModel =
            UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
        return userModel;
      } else {
        Printer.print('User not found');
        return null;
      }
    } catch (e) {
      Printer.print((e == 'Null check operator used on a null value')
          ? 'Not registered yet'
          : e.toString());
      return null;
    }
  }

  Future<UserModel?> getUserByEmail(String email) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      return UserModel.fromJson(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    } catch (e) {
      Printer.print((e == 'Null check operator used on a null value')
          ? 'Not registered yet'
          : e);
    }
    return null;
  }

  Future<void> updateUserProfileImage(File newImage) async {
    try {
      // Step 1: Upload the new image to Firebase Storage
      String userId = _auth.currentUser!.uid;
      String imagePath = 'user_profile_images/$userId/profile_image.jpg';

      UploadTask uploadTask = _storage.ref(imagePath).putFile(newImage);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

      // Step 2: Get the download URL of the uploaded image
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      // Step 3: Update the user's profile in Firestore with the new image URL
      await _firestore.collection('users').doc(userId).update({
        'profileImageUrl': downloadUrl,
      });

      // Optionally, you can also update the user's profile image in FirebaseAuth
      await _auth.currentUser!.updateProfile(photoURL: downloadUrl);
    } catch (e) {
      Printer.print('Error updating profile image: $e');
      // Handle error
    }
  }
}
