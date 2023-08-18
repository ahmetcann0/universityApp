import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/pages/course_info_pages/ders_student_bilgi.dart';
import 'package:flutter_deneme_projem/pages/login_page.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_appbar.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_listview_text.dart';
import 'package:flutter_deneme_projem/user_class/grades.dart';
import 'package:flutter_deneme_projem/user_class/lectures.dart';
import 'package:flutter_deneme_projem/user_class/student.dart';

class ders_students extends StatelessWidget {
  final lectures lectureObject;

  ders_students({
    required this.lectureObject,
  });

  @override
  Widget build(BuildContext context) {
    Map<student, grades> studentGradesMap = {};
    for (int i = 0; i < lectureObject.ogrenci_liste.length; i++) {
      if (i < lectureObject.my_grades.length) {
        studentGradesMap[lectureObject.ogrenci_liste[i]] =
            lectureObject.my_grades[i];
      }
    }

    return Scaffold(
      backgroundColor: global_theme.colorScheme.background,
      appBar: CustomAppBar(
        title: 'COURSE STUDENTS',
        color: global_theme.colorScheme.secondary,
      ),
      body: Center(
        child: ListView(
          children: [
            for (var ogrenci in lectureObject.ogrenci_liste)
              custom_listview_text(
                text: ogrenci.ad +
                    ' ' +
                    ogrenci.soyad +
                    '       ' +
                    ogrenci.student_no,
                call_ders: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ders_student_bilgi(
                        gradesObject: lectureObject.my_grades,
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
