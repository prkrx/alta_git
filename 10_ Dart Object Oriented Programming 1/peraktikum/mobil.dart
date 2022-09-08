import 'hewan.dart';

class Mobil {
  Mobil(this.kapasitas);
  int kapasitas;
  List<Hewan> DaftarHewan = [];

  void tambahMuatan(Hewan hewan){
    late int hasil = totalMuatan();
    if(hasil < kapasitas){
      DaftarHewan.add(hewan);
    } else {
      print("kapasitas penuh");
    }
    
  }

  int totalMuatan(){
    var muatan = 0;
    for(var hasil in DaftarHewan){
      muatan = muatan + hasil.berat;
    }
    return muatan;
  }
}


