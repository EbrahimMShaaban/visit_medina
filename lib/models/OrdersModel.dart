class OrdersModel {
  String? date;
  String? dateTime;
  String? uId;
  String? uIdUser;
  String? price;
  int? number;
  String? name_event;
  DateTime? time;


  OrdersModel({
    this.date,
    this.dateTime,
    this.uId,
    this.uIdUser,
    this.price,
    this.number,
    this.time,
    this.name_event,

  });

  OrdersModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateTime = json['dateTime'];
    uId = json['uId'];
    uIdUser = json['uIdUser'];
    price = json['price'];
    number = json['number'];
    name_event = json['name_event'];
    time = json['time'];

  }

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'dateTime': dateTime,
      'uId': uId,
      'uIdUser': uIdUser,
      'price': price,
      'number': number,
      'name_event': name_event,
      'time': time,
    };
  }
}
