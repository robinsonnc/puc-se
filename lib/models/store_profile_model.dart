
import 'package:flutter/material.dart';

class StoreProfileModel {
  
  final String id;
  final String storeName;
  final String imageUrl;
  final ColorScheme colorScheme;
  final int availableTables;
  final double distance;
  final double grade;

  const StoreProfileModel({
    required this.id,
    required this.storeName,
    required this.imageUrl,
    required this.colorScheme,
    this.availableTables = 10,
    this.distance = 0,
    this.grade = 4.0,
  });
  
}
