import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/pages/student_pages/student_ders.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_appbar.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_drawer.dart';
import 'package:flutter_deneme_projem/user_class/student.dart';

import '../login_page.dart';

class student_page extends StatelessWidget {
  final dynamic
      user; // Change 'dynamic' to the actual type if you have a specific class for users
  final student studentObject;
  student_page({required this.user, required this.studentObject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global_theme.colorScheme.background,
      appBar: CustomAppBar(
        title: 'Home Page',
        color: global_theme.colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 20,
              child: Container(
                alignment: Alignment.center,
                child: Icon(
                  Icons.school,
                  size: 100.0,
                  color: global_theme.colorScheme.inversePrimary,
                ),
              ),
            ),
            Expanded(
              flex: 15,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Merhaba ' + studentObject.ad,
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        color: global_theme.colorScheme.inversePrimary,
                      ),
                    ),
                    Text(
                      'Hoşgeldin',
                      style: TextStyle(
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                        color: global_theme.colorScheme.inversePrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 60,
              child: Container(
                alignment: Alignment.center,
                child: Image(
                  image: NetworkImage(
                    'https://upload.wikimedia.org/wikipedia/tr/8/89/TED_%C3%9Cniversitesi_logosu.png',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(
        user: user,
        userStudent: user,
        page_calls: [
          () {
            return student_ders(
              student1: user,
            ); // Use 'return' here
          },
        ],
        nt_image: NetworkImage(
            'https://img.freepik.com/premium-vector/business-global-economy_24877-41082.jpg'),
      ),
    );
  }
}
