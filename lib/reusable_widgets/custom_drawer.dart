import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/pages/login_page.dart';
import 'package:flutter_deneme_projem/pages/student_pages/student_homepage.dart';
import 'package:flutter_deneme_projem/pages/teacher_pages/teacher_homepage.dart';
import 'package:flutter_deneme_projem/user_class/student.dart';
import 'package:flutter_deneme_projem/user_class/teacher.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_button.dart';

import '../theme/dark_theme.dart';
import '../theme/light_theme.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    this.userStudent,
    this.userTeacher,
    required this.page_calls,
    this.nt_image,
    required this.user,
  });

  final student? userStudent;
  final teacher? userTeacher;
  final Color backgroundColor = Colors.green[100] ?? Colors.green;
  final List<Widget Function()> page_calls;
  final NetworkImage? nt_image;
  final dynamic user;

  void logoutFunc(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  void _handleThemeToggle(BuildContext context) {
    dark_mode_const = !dark_mode_const;
    if (dark_mode_const)
      global_theme = darkTheme;
    else
      global_theme = lightTheme;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          if (user is student) {
            return student_page(user: user, studentObject: user as student);
          } else
            return HomePage(user: user, teacherObject: user as teacher);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final dynamic user = userStudent ?? userTeacher;

    return Drawer(
      child: Container(
        color: global_theme.colorScheme.background,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (userTeacher?.avatar == null &&
                      userStudent?.avatar == null)
                    CircleAvatar(
                      backgroundColor: Colors.green[200],
                      radius: 50.0,
                      child: Text(
                        (user.ad.substring(0, 1) + user.soyad.substring(0, 1))
                            .toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                          color: Colors.white,
                        ),
                      ),
                    )
                  else
                    CircleAvatar(
                      backgroundColor: Colors.green[200],
                      radius: 50.0,
                      backgroundImage:
                          userStudent?.avatar ?? userTeacher?.avatar,
                    ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Title(
                        color: global_theme.colorScheme.secondary,
                        child: Text(
                          userStudent?.ad ?? userTeacher?.ad ?? 'Unknown',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20.0,
                              color: global_theme.colorScheme.inversePrimary),
                        ),
                      ),
                      Title(
                        color: global_theme.colorScheme.secondary,
                        child: Text(
                          userStudent?.soyad ?? userTeacher?.soyad ?? 'Unknown',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0,
                              color: global_theme.colorScheme.inversePrimary),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Title(
                        color: global_theme.colorScheme.secondary,
                        child: Text(userStudent?.student_no ?? '',
                            style: TextStyle(
                                color: global_theme.colorScheme.inversePrimary,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.0,
                                letterSpacing: 2.0)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  leading: Icon(
                    Icons.book,
                    color: global_theme.colorScheme.inversePrimary,
                  ),
                  title: Text(
                    'My Courses',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 4.0,
                      color: global_theme.colorScheme.inversePrimary,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => page_calls[0]()),
                    );
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                if (user != userStudent)
                  Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.library_books_outlined,
                          color: global_theme.colorScheme.inversePrimary,
                        ),
                        title: Text(
                          'Courses',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 4.0,
                            color: global_theme.colorScheme.inversePrimary,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => page_calls[1]()),
                          );
                        },
                      ),
                    ],
                  ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: custom_button(
                    title: 'Logout',
                    onTap: () => logoutFunc(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (dark_mode_const == true)
                        Icon(Icons.wb_sunny_outlined)
                      else
                        Icon(Icons.wb_sunny),
                      Switch(
                        value: dark_mode_const,
                        onChanged: (value) => _handleThemeToggle(context),
                      ),
                      if (dark_mode_const == false)
                        Transform.rotate(
                          angle: -120,
                          child: Icon(
                            Icons.nightlight_outlined,
                          ),
                        )
                      else
                        Transform.rotate(
                            angle: -120,
                            child: Icon(
                              Icons.nightlight,
                            ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
