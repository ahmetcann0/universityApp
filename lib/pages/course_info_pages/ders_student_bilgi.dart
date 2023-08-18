import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/pages/login_page.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_appbar.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_listview_text.dart';
import 'package:flutter_deneme_projem/user_class/grades.dart';

class ders_student_bilgi extends StatefulWidget {
  final List<grades> gradesObject;

  ders_student_bilgi({
    required this.gradesObject,
  });

  @override
  _DersStudentBilgiState createState() => _DersStudentBilgiState();
}

class _DersStudentBilgiState extends State<ders_student_bilgi> {
  List<grades> modifiedGrades = [];

  @override
  void initState() {
    super.initState();
    modifiedGrades.addAll(widget.gradesObject);
  }

  void _updateGrade(int index, int newGrade) {
    setState(() {
      modifiedGrades[index].setPuan = newGrade;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global_theme.colorScheme.background,
      appBar: CustomAppBar(
        title: 'COURSE OGRENCI DETAIL',
        color: global_theme.colorScheme.secondary,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: modifiedGrades.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                custom_listview_text(text: modifiedGrades[index].ad),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Grade: ${modifiedGrades[index].puan}',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.0)),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            int newGrade = modifiedGrades[index].puan;
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: Text('Update Grade'),
                                  content: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      newGrade = int.parse(value);
                                      setState(() {});
                                    },
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Cancel'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        _updateGrade(index, newGrade);
                                        Navigator.pop(context);
                                      },
                                      child: Text('Save'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Text('Change Grade'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
