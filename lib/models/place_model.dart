import 'package:project_one/models/location.dart';

class PlaceModel {
  final String id;
  final int guestsCount;
  final int bedroomsCount;
  final int bedsCount;
  final int bathroomCount;
  final List<String> placeOffers;
  final List<String> images;
  final bool isHideFromGuests;
  final int price;
  final String title;
  final String decoration;
  final int primaryDiscount;
  final int weeklyDiscount;
  final int monthlyDiscount;
  final String placeType;
  final String street;
  final String city;
  final String country;
  final LocationModel location;

  PlaceModel({
    required this.id,
    required this.street,
    required this.city,
    required this.country,
    required this.guestsCount,
    required this.bedroomsCount,
    required this.bedsCount,
    required this.bathroomCount,
    required this.placeOffers,
    required this.images,
    required this.isHideFromGuests,
    required this.price,
    required this.title,
    required this.decoration,
    required this.primaryDiscount,
    required this.weeklyDiscount,
    required this.monthlyDiscount,
    required this.placeType,
    required this.location,
  });

  factory PlaceModel.fromJson(Map<String, dynamic>? json) {
    return PlaceModel(
      id: json!['id'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      country: json['country'] as String,
      guestsCount: json['guests_count'] as int,
      bedroomsCount: json['bedrooms_count'] as int,
      bedsCount: json['beds_count'] as int,
      bathroomCount: json['bathroom_count'] as int,
      placeOffers: (json['place_offers'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      images:
          (json['images'] as List<dynamic>).map((e) => e.toString()).toList(),
      isHideFromGuests: json['is_hide_from_guests'] as bool,
      price: json['price'] as int,
      title: json['title'] as String,
      decoration: json['subtitle'] as String,
      primaryDiscount: json['primary_discount'] as int,
      weeklyDiscount: json['weekly_discount'] as int,
      monthlyDiscount: json['monthly_discount'] as int,
      placeType: json['place_type'] as String,
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'street': street,
      'city': city,
      'country': country,
      'guests_count': guestsCount,
      'bedrooms_count': bedroomsCount,
      'beds_count': bedsCount,
      'bathroom_count': bathroomCount,
      'place_offers': placeOffers,
      'images': images,
      'is_hide_from_guests': isHideFromGuests,
      'price': price,
      'title': title,
      'subtitle': decoration,
      'primary_discount': primaryDiscount,
      'weekly_discount': weeklyDiscount,
      'monthly_discount': monthlyDiscount,
      'place_type': placeType,
      'location': location.toJson(),
    };
  }
}
