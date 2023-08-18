import 'package:flutter_deneme_projem/user_class/grades.dart';
import 'package:flutter_deneme_projem/user_class/student.dart';

class lectures {
  final String ad;
  final String kod;
  final List<student> ogrenci_liste;
  int _gecme_notu;
  final List<grades> my_grades;

  lectures({
    required this.ad,
    required this.kod,
    required this.ogrenci_liste,
    required int gecme_notu,
    required this.my_grades,
  }) : _gecme_notu = gecme_notu;

  int get gecme_notu => _gecme_notu;
  void setGecmeNotu(int newGrade) {
    _gecme_notu = newGrade;
  }

  lectures copyWith({int? gecme_notu}) {
    return lectures(
      ad: this.ad,
      kod: this.kod,
      ogrenci_liste: this.ogrenci_liste,
      gecme_notu: gecme_notu ?? this._gecme_notu,
      my_grades: this.my_grades,
    );
  }
}
