class Invoice {
  int? id;
  late String name;
  late String discription;
  late String ram;
  late String cpu;
  late String imgPath;
  late String screen;
  int? price;
  int? InvoiceTypeId;
  String? imageName;
  Null? deletedAt;

  Invoice({
    this.id,
    required this.name,
    required this.discription,
    required this.ram,
    required this.cpu,
    required this.screen,
    required this.imgPath,
    this.price,
    this.InvoiceTypeId,
    this.imageName,
  });

  Invoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    discription = json['discription'];
    ram = json['ram'];
    cpu = json['cpu'];
    imgPath = json['img_path'];
    screen = json['screen'];
    price = json['price'];
    InvoiceTypeId = json['Invoice_type_id'];
    imageName = json['image_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['discription'] = this.discription;
    data['ram'] = this.ram;
    data['cpu'] = this.cpu;
    data['img_path'] = this.imgPath;
    data['screen'] = this.screen;
    data['price'] = this.price;
    data['Invoice_type_id'] = this.InvoiceTypeId;
    data['image_name'] = this.imageName;
    return data;
  }
}

List<Invoice> Invoices = [
  Invoice(
      id: 1,
      imgPath:
          'https://megabest.vn/wp-content/uploads/2021/06/laptop-duoi-10-trieu-megabest.jpg',
      name: 'Dell Inspiron 3573 / Pentium N500 / 4GB / 500GB',
      price: 1000000,
      ram: '4GB',
      cpu: 'Intel core i7 5400u',
      screen: '15.2 in',
      discription: 'Hello ban day la description cua san pham nay.'),
  Invoice(
      id: 2,
      imgPath:
          'https://megabest.vn/wp-content/uploads/2021/06/laptop-duoi-10-trieu-megabest-2.jpg',
      name: 'Dell Inspiron 3573 / Pentium N500 / 4GB / 500GB',
      price: 2000000,
      ram: '4GB',
      cpu: 'Intel core i7 5400u',
      screen: '15.2 in',
      discription: 'Hello ban day la description cua san pham nay.'),
  Invoice(
      id: 3,
      imgPath:
          'https://megabest.vn/wp-content/uploads/2021/06/laptop-duoi-10-trieu-megabest-3.jpg',
      name: 'Laptop Asus Vivobook D509DA-EJ800T',
      price: 1500000,
      ram: '4GB',
      cpu: 'Intel core i7 5400u',
      screen: '15.2 in',
      discription: 'Hello ban day la description cua san pham nay.'),
  Invoice(
      id: 4,
      imgPath:
          'https://megabest.vn/wp-content/uploads/2021/06/laptop-duoi-10-trieu-megabest.png',
      name: 'Dell Vostro 3568',
      price: 1200000,
      ram: '4GB',
      cpu: 'Intel core i7 5400u',
      screen: '15.2 in',
      discription: 'Hello ban day la description cua san pham nay.'),
  Invoice(
      id: 5,
      imgPath:
          'https://megabest.vn/wp-content/uploads/2021/06/laptop-duoi-10-trieu-megabest-2.jpg',
      name: 'Laptop Lenovo IdeaPad 3 15ADA05 81W100USVN',
      price: 1400000,
      ram: '4GB',
      cpu: 'Intel core i7 5400u',
      screen: '15.2 in',
      discription: 'Hello ban day la description cua san pham nay.'),
];
