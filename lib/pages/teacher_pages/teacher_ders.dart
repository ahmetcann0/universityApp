import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/pages/course_info_pages/ders_bilgi.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_appbar.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_listview_text.dart';
import 'package:flutter_deneme_projem/user_class/teacher.dart';

import '../login_page.dart'; // Import from the same directory

class AkademisyenDers extends StatelessWidget {
  final teacher current_user;

  AkademisyenDers({required this.current_user}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global_theme.colorScheme.background,
      appBar: CustomAppBar(
        title: 'My Courses',
        color: global_theme.colorScheme.secondary,
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                for (var lecture
                    in current_user.dersler ?? []) // Use null-aware operator
                  custom_listview_text(
                    text: lecture.kod,
                    call_ders: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ders_bilgi(
                            lectureObject: lecture,
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
