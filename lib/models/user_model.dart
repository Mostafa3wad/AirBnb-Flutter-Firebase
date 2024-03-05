import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? userID;
  final String? firstName;
  final String? photoUrl;
  final String? lastName;
  final String? phone;
  final String? email;
  final List<dynamic>? wishlist;

  final Timestamp? birthday;
  final List<dynamic>? places;

  const UserModel({
    this.userID,
    this.firstName,
    this.lastName,
    this.phone,
    this.wishlist,
    this.email,
    this.photoUrl,
    this.places,
    this.birthday,
  });

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'firstName': firstName,
      'lastName': lastName,
      'wishlist': wishlist,
      'phone': phone,
      'email': email,
      'dateTime': birthday,
      'photoUrl': photoUrl,
      'places': places
    };
  }

  factory UserModel.fromJson(Map<String, dynamic>? json) {
    return UserModel(
      userID: json!['userID'],
      places: json['places'],
      firstName: json['firstName'],
      photoUrl: json['photoUrl'],
      lastName: json['lastName'],
      phone: json['phone'],
      email: json['email'],
      wishlist: json['wishlist'] ?? [],
      birthday: json['birthday'] as Timestamp?,
    );
  }

  @override
  List<Object?> get props => [
        userID,
        firstName,
        lastName,
        email,
        phone,
        wishlist,
        birthday,
        photoUrl,
      ];
}
