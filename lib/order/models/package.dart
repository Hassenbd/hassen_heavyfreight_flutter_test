enum TypePackage { small, medium, large }

class Package {
  String id;
  String title;
  TypePackage type;
  String image;
  bool selected=false;
  Package(
      {required this.id,
      required this.title,
      required this.type,
      required this.image});
}
