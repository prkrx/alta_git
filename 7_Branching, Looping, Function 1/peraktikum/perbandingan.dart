import 'dart:io';

void main(List<String> args) {
  stdout.write("masukkan angka yang diinginkan = ");

  int n = int.parse(stdin.readLineSync()!);
  
  if(n > 70) {
    print("A");
  }
  else if(n > 40){
    print("B");
  }
  else if(n > 0){
    print("C");
  }
  else {
    print("teks kosong");
  }
}