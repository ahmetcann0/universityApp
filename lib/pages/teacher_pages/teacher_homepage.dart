import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/pages/teacher_pages/tüm_dersler.dart';
import 'package:flutter_deneme_projem/user_class/teacher.dart';
import '../login_page.dart';
import 'teacher_ders.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_drawer.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_appbar.dart';

class HomePage extends StatelessWidget {
  final dynamic user;
  final teacher teacherObject;

  HomePage({required this.user, required this.teacherObject});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: global_theme,
        home: Scaffold(
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
                          'Merhaba ' + teacherObject.ad,
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
            userTeacher: user,
            page_calls: [
              () => AkademisyenDers(
                    current_user: user,
                  ),
              () => akademisyen_sinif(),
            ],
            nt_image: const NetworkImage(
              'https://www.w3schools.com/howto/img_avatar.png',
            ),
          ),
        ));
  }
}
