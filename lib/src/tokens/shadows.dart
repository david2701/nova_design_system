import 'package:flutter/material.dart';

/// Class containing all shadow tokens for the Nova design system
class NovaShadows {
  // Small shadows
  static const List<BoxShadow> xs = [
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  static const List<BoxShadow> sm = [
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 1),
      blurRadius: 3,
    ),
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  // Medium shadows
  static const List<BoxShadow> md = [
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
  ];

  static const List<BoxShadow> lg = [
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 10),
      blurRadius: 15,
    ),
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 4),
      blurRadius: 6,
    ),
  ];

  // Large shadows
  static const List<BoxShadow> xl = [
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 20),
      blurRadius: 25,
    ),
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 10),
      blurRadius: 10,
    ),
  ];

  static const List<BoxShadow> xxl = [
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 25),
      blurRadius: 50,
    ),
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 12),
      blurRadius: 24,
    ),
  ];

  // Special shadows
  static const List<BoxShadow> inner = [
    BoxShadow(
      color: Color(0x0A000000),
      offset: Offset(0, 2),
      blurRadius: 4,
      spreadRadius: -2,
    ),
  ];

  static const List<BoxShadow> none = [];
} 