class EventModel {
  String? address;
  String? linkAddress;
  String? uId;
  String? docuId;
  String? description;
  bool? accept;
  bool? favorite;
  String? price;
  String? number;
  String? time;
  String? dateTime;
  String? date;
  String? event;
  String? postImage;
  String? type;
  String? typePrice;
  String? name;
  String? nameEvent;

  EventModel({
    this.address,
    this.linkAddress,
    this.uId,
    this.docuId,
    this.description,
    this.accept,
    this.favorite,
    this.price,
    this.number,
    this.time,
    this.dateTime,
    this.date,
    this.postImage,
    this.event,
    this.type,
    this.typePrice,
    this.name,
    this.nameEvent,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    linkAddress = json['linkAddress'];
    uId = json['uId'];
    docuId = json['docuId'];
    description = json['description'];
    accept = json['accept'];
    favorite = json['Favourite'];
    price = json['price'];
    number = json['number'];
    time = json['time'];
    dateTime = json['dateTime'];
    date = json['date'];
    postImage = json['postImage'];
    event = json['event'];
    type = json['type'];
    typePrice = json['typePrice'];
    name = json['name'];
    nameEvent = json['nameEvent'];
  }

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'linkAddress': linkAddress,
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
      'typePrice': typePrice,
      'name': name,
      'nameEvent': nameEvent,
      'Favourite': favorite,
    };
  }
}
