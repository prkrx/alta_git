abstract class Matematika {
  void hasil();
}

class KPK implements Matematika {
    @override
    int hasil({int x = 48, int y = 66}) => (x * y) ~/ gcd(x, y);
    int gcd(int x, int y) {
    while (y != 0) {
      var t = y;
      y = x % t;
      x = t;
    }
    return x;
  }
}

class FPB implements Matematika {
  @override
    int hasil({int x = 48, int y = 66}) {
    while (y != 0) {
      var t = y;
      y = x % t;
      x = t;
    }
    return x;
  }
}


void main(List<String> args) {
  KPK operation = KPK();
  FPB operation2 = FPB();
  print("Hasil dari KPK adalah = " + operation.hasil().toString());
  print("Hasil dari FPB adalah = " + operation2.hasil().toString());
}