import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_appbar.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_listview_text.dart';
import 'package:flutter_deneme_projem/user_class/student.dart';

import '../login_page.dart';

class student_ders extends StatelessWidget {
  final student student1; // Pass the student object as a parameter

  student_ders({required this.student1}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Lectures',
        color: global_theme.colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView.builder(
          itemCount:
              student1.dersler?.length ?? 0, // Number of items in the list
          itemBuilder: (context, index) {
            final lecture = student1.dersler?[index]; // Use null-aware operator
            return lecture != null
                ? custom_listview_text(text: lecture)
                : SizedBox
                    .shrink(); // Return an empty widget if lecture is null
          },
        ),
      ),
      backgroundColor: global_theme.colorScheme.background,
    );
  }
}
