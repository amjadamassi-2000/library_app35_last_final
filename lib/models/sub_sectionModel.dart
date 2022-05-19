class SubSectionModel {
  bool status;
  int code;
  String message;
  List<Sub> sub;

  SubSectionModel({this.status, this.code, this.message, this.sub});

  SubSectionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sub'] != null) {
      sub = <Sub>[];
      json['sub'].forEach((v) {
        sub.add( Sub.fromJson(v));
      });
    }
  }


}

class Sub {
  int id;
  String name;

  Sub({this.id, this.name});

  Sub.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }


}