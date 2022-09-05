List list = [
  { 'name': 'John Doe', 'age': 30},
  { 'name': 'Robbin', 'age': 40},
  { 'name': 'Tom', 'age': 50}
];
void main() {

  var result = Map.fromIterable(list, key: (v) => v["name"], value: (v) => v["age"]);

  print(result);
}