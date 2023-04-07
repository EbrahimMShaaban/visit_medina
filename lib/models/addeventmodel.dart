class EventModel {
  String? address;
  String? uId;
  String? docuId;
  String? description;
  bool? accept;
  String? price;
  String? number;
  String? time;
  String? dateTime;
  String? date;
  String? event;
  String? postImage;
  String? type;
  String? name;

  EventModel({
    this.address,
    this.uId,
    this.docuId,
    this.description,
    this.accept,
    this.price,
    this.number,
    this.time,
    this.dateTime,
    this.date,
    this.postImage,
    this.event,
    this.type,
    this.name,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    uId = json['uId'];
    docuId = json['docuId'];
    description = json['description'];
    accept = json['accept'];
    price = json['price'];
    number = json['number'];
    time = json['time'];
    dateTime = json['dateTime'];
    date = json['date'];
    postImage = json['postImage'];
    event = json['event'];
    type = json['type'];
    name = json['name'];
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'event': event,
      'uId': uId,
      'docuId': docuId,
      'description': description,
      'accept': accept,
      'price': price,
      'number': number,
      'time': time,
      'dateTime': dateTime,
      'date': date,
      'postImage': postImage,
      'type': type,
      'name': name,
    };
  }
}
