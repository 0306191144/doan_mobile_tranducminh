class ProductType {
  final int id;
  final String name;
  final int status;
  final String image;
  ProductType(
      {required this.id,
      required this.name,
      required this.image,
      required this.status});

  ProductType.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        status = json['status'];
}

List<ProductType> category = [
  ProductType(
      id: 1,
      image:
          'https://res.cloudinary.com/quankiu/image/upload/v1645585399/dell_rptdso.png',
      name: 'Dell',
      status: 1),
  ProductType(
      id: 2,
      image:
          'https://res.cloudinary.com/quankiu/image/upload/v1645585400/hp_xoi4su.png',
      name: 'Hp',
      status: 1),
  ProductType(
      id: 3,
      image:
          'https://res.cloudinary.com/quankiu/image/upload/v1645585399/apple_f1lyt8.jpg',
      name: 'Apple',
      status: 1),
  ProductType(
      id: 4,
      image:
          'https://res.cloudinary.com/quankiu/image/upload/v1645585400/lenovo_ldzfhz.jpg',
      name: 'Lenovo',
      status: 1),
];
