import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_one/models/place_model.dart';
import 'package:project_one/services/printer.dart';
import 'package:uuid/uuid.dart';

class FirestorRepository {
  final _uuid = const Uuid();

  final CollectionReference _places =
      FirebaseFirestore.instance.collection('places');

  Future<List<PlaceModel>> getAllPlases() async {
    List<PlaceModel> placeModels = [];
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('places').get();

      placeModels = querySnapshot.docs
          .map((doc) => PlaceModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      Printer.print("Get All Places");

      return placeModels;
    } catch (e) {
      Printer.print((e == 'Null check operator used on a null value')
          ? 'Not registered yet'
          : e);
    }
    return [];
  }

  Future<void> uploadNewPlace(PlaceModel placeModel) async {
    final String uid = FirebaseAuth.instance.currentUser!.uid;

    // upload new Place in Firestor
    await _places
        .add(placeModel.toJson())
        .then((value) => Printer.print('Successfuly'))
        .catchError((error) => Printer.print("Failed to add user: $error"));

    // add a palce id  in User data
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .update({
          'id': FieldValue.arrayUnion([placeModel.id])
        })
        .then((value) => Printer.print('Successfuly'))
        .catchError((error) => Printer.print("Failed to add user: $error"));
  }

  Future<List<String>> uploadImages(
      {required List<XFile?> images,
      required String userName,
      required String placeId}) async {
    List<String> imagesURL = [];
    try {
      for (var i = 0; images.length > i; i++) {
        var refStorge = FirebaseStorage.instance
            .ref()
            .child('Places/$userName/${_uuid.v1()}..jpg');
        await refStorge.putFile(File(images[i]!.path));
        var url = await refStorge.getDownloadURL();
        imagesURL.add(url.toString());
      }

      return imagesURL;
    } catch (e) {
      Printer.print('Error uploading image to Cloud Storage: $e');
      throw e;
    }
  }
}
// final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// final FirebaseStorage _storage = FirebaseStorage.instance;

// Future<void> uploadDataToFirestore(
//     Map<String, dynamic> data, String collectionName) async {
//   try {
//     await _firestore.collection(collectionName).add(data);
//     print('Data uploaded successfully to Firestore!');
//   } catch (e) {
//     print('Error uploading data to Firestore: $e');
//     throw e;
//   }
// }
