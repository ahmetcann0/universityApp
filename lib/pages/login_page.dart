import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/pages/teacher_pages/teacher_homepage.dart';
import 'package:flutter_deneme_projem/pages/student_pages/student_homepage.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_appbar.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_toggle_button.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_button.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_textfield.dart';
import 'package:flutter_deneme_projem/theme/dark_theme.dart';
import 'package:flutter_deneme_projem/theme/light_theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data.dart';

bool dark_mode_const = false;
ThemeData global_theme = lightTheme;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isStudentSelected = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _handleButtonPress(int index) {
    setState(() {
      isStudentSelected = index == 0;
    });
  }

  void _handleThemeToggle() {
    setState(() {
      dark_mode_const = !dark_mode_const;
      if (dark_mode_const)
        global_theme = darkTheme;
      else
        global_theme = lightTheme;
    });
  }

  ThemeData generateTheme(bool dark_mode_const) {
    if (dark_mode_const)
      return darkTheme;
    else
      return lightTheme;
  }

  void loginFunc(BuildContext context, String email, String password) {
    print("Entered Email: $email");
    print("Entered Password: $password");

    dynamic currentUser;

    if (isStudentSelected) {
      if (student1.email == email && student1.password == password) {
        print("Student login successful");
        currentUser = student1;
      } else if (student2.email == email && student2.password == password) {
        print("Student login successful");
        currentUser = student2;
      } else if (student3.email == email && student3.password == password) {
        print("Student login successful");
        currentUser = student3;
      } else {
        print("Student login failed");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('You have entered an incorrect email or password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } else {
      if (teacher1.email == email && teacher1.password == password) {
        print("Teacher login successful");
        currentUser = teacher1;
      } else if (teacher2.email == email && teacher2.password == password) {
        print("Teacher login successful");
        currentUser = teacher2;
      } else {
        print("Teacher login failed");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Login Failed'),
            content: Text('You have entered an incorrect email or password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    if (currentUser != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            if (isStudentSelected) {
              return student_page(
                user: currentUser,
                studentObject: currentUser,
              );
            } else {
              return HomePage(user: currentUser, teacherObject: currentUser);
            }
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: global_theme,
        home: Scaffold(
          backgroundColor: global_theme.colorScheme.background,
          appBar: CustomAppBar(
            title: ('LOGIN'),
            color: global_theme.colorScheme.inversePrimary,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Toggle Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (dark_mode_const == true)
                        Icon(Icons.wb_sunny_outlined)
                      else
                        Icon(Icons.wb_sunny),
                      Switch(
                        value: dark_mode_const,
                        onChanged: (value) => _handleThemeToggle(),
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
                SizedBox(height: 50.0),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'University App ',
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: global_theme.colorScheme.inversePrimary),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.0, bottom: 20.0),
                  child: Icon(
                      isStudentSelected
                          ? Icons.groups_3_sharp
                          : Icons.assignment_turned_in_outlined,
                      size: 100.0,
                      color: global_theme.colorScheme.inversePrimary),
                ),
                Container(
                  child: CustomToggleButton(
                    isSelected: [isStudentSelected, !isStudentSelected],
                    onPressed: _handleButtonPress,
                    children: [
                      Text(
                        'Student',
                        style: TextStyle(
                            color: global_theme.colorScheme.inversePrimary,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Teacher',
                        style: TextStyle(
                            color: global_theme.colorScheme.inversePrimary,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                  child: custom_textfield(
                    text: 'Email',
                    border_color: global_theme.colorScheme.primary,
                    obscureText: false,
                    fillColor: global_theme.colorScheme.background,
                    text_color: global_theme.colorScheme.inversePrimary,
                    controller: emailController,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: custom_textfield(
                    text: 'Password',
                    border_color: global_theme.colorScheme.primary,
                    obscureText: true,
                    fillColor: global_theme.colorScheme.background,
                    text_color: global_theme.colorScheme.inversePrimary,
                    controller: passwordController,
                  ),
                ),
                SizedBox(height: 10.0),
                TextButton(
                  onPressed: () async {
                    const url =
                        'https://twitter.com/i/flow/password_reset?input_flow_data=%7B%22requested_variant%22%3A%22eyJwbGF0Zm9ybSI6IlJ3ZWIifQ%3D%3D%22%7D';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      print('Could not launch $url');
                    }
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: global_theme.colorScheme.inversePrimary,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                custom_button(
                    title: 'Sign In',
                    onTap: () {
                      print(emailController.text);
                      loginFunc(context, emailController.text,
                          passwordController.text);
                    }),
              ],
            ),
          ),
        ));
  }
}
