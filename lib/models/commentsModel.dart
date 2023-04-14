class CommentsModel {
  String? name_event;
  String? name_user;
  String? uId;
  String? docuId;
  String? title;
  double? rating;


  CommentsModel({
    this.name_event,
    this.name_user,
    this.uId,
    this.docuId,
    this.title,
    this.rating,

  });

  CommentsModel.fromJson(Map<String, dynamic> json) {
    name_event = json['name_event'];
    name_user = json['name_user'];
    uId = json['uId'];
    docuId = json['docuId'];
    title = json['title'];
    rating = json['rating'];

  }

  Map<String, dynamic> toMap() {
    return {
      'name_event': name_event,
      'name_user': name_user,
      'uId': uId,
      'docuId': docuId,
      'title': title,
      'rating': rating,
    };
  }
}
