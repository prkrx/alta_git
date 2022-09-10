abstract class BangunRuang {
 
 void volume(); 
}

class Balok extends BangunRuang {
  @override
  int volume({int panjang = 3, int lebar = 2, int tinggi = 2}) => panjang * lebar * tinggi;
}

class Kubus extends BangunRuang {
  @override
  int volume({sisi = 5}) => sisi * sisi * sisi;
}

void main(List<String> args) {
  Balok bangun = Balok();
  Kubus bangun1 = Kubus();
  print("hasil dari menghitung balok adalah " + bangun.volume().toString());
  print("hasil dari menghitung kubus adalah " + bangun1.volume().toString());
  
}