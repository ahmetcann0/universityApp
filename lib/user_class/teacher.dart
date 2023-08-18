import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/user_class/lectures.dart';

class teacher {
  final String email;
  final String password;
  final String ad;
  final String soyad;
  final List<lectures>? dersler;
  final NetworkImage? avatar;

  teacher({
    required this.email,
    required this.password,
    required this.ad,
    required this.soyad,
    this.dersler,
    this.avatar,
  });
}
