class ImageDataModel {
  final String imageUrl;

  ImageDataModel(this.imageUrl);
}

List<String> url = [
  "https://wallpaperaccess.com/full/745085.jpg",
  "https://cdn.wallpapersafari.com/38/64/HpD7OW.png",
  "https://wallpapercave.com/wp/wp5487628.jpg"
];

final List<ImageDataModel> imageData =
    List.generate(
      url.length, (index) => ImageDataModel(url[index])
    );