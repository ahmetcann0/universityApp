import 'package:flutter/material.dart';
import 'package:flutter_deneme_projem/pages/course_info_pages/ders_students.dart';
import 'package:flutter_deneme_projem/pages/login_page.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_appbar.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_listview_text.dart';
import 'package:flutter_deneme_projem/reusable_widgets/custom_text.dart';
import 'package:flutter_deneme_projem/user_class/lectures.dart';

class ders_bilgi extends StatefulWidget {
  final lectures lectureObject;

  ders_bilgi({
    required this.lectureObject,
  });

  @override
  _ders_bilgiState createState() => _ders_bilgiState();
}

class _ders_bilgiState extends State<ders_bilgi> {
  late TextEditingController passGradeController;

  @override
  void initState() {
    super.initState();
    passGradeController =
        TextEditingController(text: widget.lectureObject.gecme_notu.toString());
  }

  @override
  void dispose() {
    passGradeController.dispose();
    super.dispose();
  }

  void _updateGrade(int newGrade) {
    setState(() {
      widget.lectureObject.setGecmeNotu(newGrade);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: global_theme.colorScheme.background,
      appBar: CustomAppBar(
        title: 'COURSE DETAIL',
        color: global_theme.colorScheme.secondary,
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              SizedBox(height: 30.0),
              Container(
                child: custom_text(
                  text: 'COURSE NAME',
                ),
              ),
              custom_listview_text(text: widget.lectureObject.ad),
              SizedBox(height: 30.0),
              custom_text(
                text: 'COURSE CODE',
              ),
              custom_listview_text(text: widget.lectureObject.kod),
              SizedBox(height: 30.0),
              custom_text(
                text: 'PASS GRADE',
              ),
              SizedBox(height: 20.0),
              Text('${widget.lectureObject.gecme_notu}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2.0)),
              SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 150.0, vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        int newGrade = widget.lectureObject.gecme_notu;
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
                                    _updateGrade(newGrade);
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
                  child: Text('Update Grade'),
                ),
              ),
              SizedBox(height: 30.0),
              custom_text(
                text: 'STUDENTS INFO',
              ),
              custom_listview_text(
                text: 'STUDENTS',
                call_ders: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ders_students(
                        lectureObject: widget.lectureObject,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
