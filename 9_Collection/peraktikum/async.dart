int add(int list, int pengali) {
  return list * pengali;
}

void main() async {
  var listData = [1, 2, 3, 4];
  var angkaPengali = 2;

  await Future.delayed(Duration(seconds: 1), () {
    for (var i = 0; i < listData.length; i++) {
      print(add(listData[i], angkaPengali));
    }
  });
}