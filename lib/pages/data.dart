import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/user_class/grades.dart';
import 'package:flutter_deneme_projem/user_class/lectures.dart';
import 'package:flutter_deneme_projem/user_class/student.dart';
import 'package:flutter_deneme_projem/user_class/teacher.dart';

student student1 = student(
  email: '23',
  password: '1',
  student_no: '195',
  ad: 'Ahmet',
  soyad: 'Öztürk',
  dersler: ['CMPE-101-01', 'CMPE-101-02', 'CMPE-252-01'],
);

student student2 = student(
  email: 'b',
  password: '2',
  student_no: '1123',
  ad: 'Beril',
  soyad: 'Kaya',
  dersler: ['CMPE-102-01', 'CMPE-252-01'],
  avatar: NetworkImage(
      'https://w7.pngwing.com/pngs/13/178/png-transparent-spongebob-squarepants-illustration-graphy-computer-icons-sponge-bob-cartoon-spongebob-squarepants-sponge-bob-thumbnail.png'),
);
student student3 = student(
  email: '3',
  password: '3',
  student_no: '33333',
  ad: 'Deniz',
  soyad: 'Akın',
  dersler: ['CMPE-101-01', 'CMPE-252-01'],
);
teacher teacher1 = teacher(
  email: 'abc',
  password: '3',
  ad: 'Alan',
  soyad: 'Turing',
  dersler: [lectures1, lectures2],
  avatar: NetworkImage(
      'https://static.scientificamerican.com/blogs/cache/file/DC6E7EC3-601E-4420-A28F5DAA6FB435B7_source.jpg?w=590&h=800&5E94C9AC-2AD3-41FE-8CE3E65A179EE6B5'),
);
teacher teacher2 = teacher(
  email: 'd',
  password: '4',
  ad: 'Albert',
  soyad: 'Einstein',
  dersler: [lectures3, lectures4],
  avatar: NetworkImage(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSj7ECoI_35c3STa3ffQIwCT2TqddpakVNXUg&usqp=CAU'),
);

lectures lectures1 = lectures(
  ad: 'Programlamaya Giriş',
  kod: 'CMPE-101-01',
  gecme_notu: 50,
  ogrenci_liste: [student1, student3],
  my_grades: [grades1, grades2],
);

lectures lectures2 = lectures(
  ad: 'Programlamaya Giriş',
  kod: 'CMPE-101-02',
  gecme_notu: 30,
  ogrenci_liste: [
    student1,
  ],
  my_grades: [grades3],
);

lectures lectures3 = lectures(
  ad: 'Hesaplama Teorisi',
  kod: 'CMPE-102-01',
  gecme_notu: 60,
  ogrenci_liste: [student2],
  my_grades: [grades2],
);

lectures lectures4 = lectures(
  ad: 'C Programlama',
  kod: 'CMPE-252-01',
  gecme_notu: 25,
  ogrenci_liste: [student1, student2, student3],
  my_grades: [grades2],
);

grades grades1 = grades(
  ad: 'MIDTERM',
  katsayi: 30,
  puan: 50,
);

grades grades2 = grades(
  ad: 'FINAL',
  katsayi: 50,
  puan: 89,
);

grades grades3 = grades(
  ad: 'PROJE',
  katsayi: 20,
  puan: 40,
);
