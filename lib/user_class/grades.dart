class grades {
  final String ad;
  final int katsayi;
  int _puan;

  grades({
    required this.ad,
    required this.katsayi,
    required int puan,
  }) : _puan = puan;

  int get puan => _puan;
  set setPuan(int yeniNot) {
    if (yeniNot >= 0 && yeniNot <= 100) {
      _puan = yeniNot;
    }
  }

  grades copyWith({int? puan}) {
    return grades(
      ad: this.ad,
      katsayi: this.katsayi,
      puan: puan ?? this.puan,
    );
  }
}
