import 'hewan.dart';
import 'mobil.dart';

void main(List<String> args) async {
  late Hewan tikus = Hewan(4);
  late Hewan kelalawar = Hewan(2);
  late Hewan gajah = Hewan(10);

  late Mobil Avanza = Mobil(30);

  Avanza.tambahMuatan(tikus);
  Avanza.tambahMuatan(kelalawar);
  Avanza.tambahMuatan(gajah);

  print(Avanza.totalMuatan());
}