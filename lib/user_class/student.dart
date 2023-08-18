import 'package:flutter/material.dart';

class student {
  final String email;
  final String password;
  final String student_no;
  final String ad;
  final String soyad;
  final List<String>? dersler;
  final NetworkImage? avatar;

  student(
      {Key? key,
      required this.email,
      required this.password,
      required this.student_no,
      required this.ad,
      required this.soyad,
      this.dersler,
      this.avatar});
}
