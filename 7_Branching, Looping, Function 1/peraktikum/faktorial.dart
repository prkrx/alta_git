import 'dart:io';
 
void main() {
  stdout.write('masukkan nilai = ');
  int N = int.parse(stdin.readLineSync()!);
 
  int result = 1;
  for (int i = 1; i <= N; i++) {
    result *= i;
  }
 
  print('hasil dari faktorial adalah = $N');
  print(result);
}