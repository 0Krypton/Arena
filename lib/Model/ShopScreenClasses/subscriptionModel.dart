import 'package:flutter/material.dart';

class SubscriptionModel {
  SubscriptionModel({
    @required this.title,
    @required this.tiere,
    @required this.lunchUrl,
    @required this.imageUrl,
    @required this.bgImageUrl,
    @required this.optImageUrl,
    @required this.discription,
    @required this.primaryColor,
    @required this.secondaryColor,
    @required this.beginColor,
    @required this.endColor,
  });

  final String title;
  final String tiere;

  final String lunchUrl;

  final String imageUrl;
  final String bgImageUrl;
  final String optImageUrl;

  final List<String> discription;

  final Color primaryColor;
  final Color secondaryColor;

  final Color beginColor;
  final Color endColor;
}
