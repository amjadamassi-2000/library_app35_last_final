class DrawerModel {
  bool status;
  int code;
  String message;
  List<Data> data;

  DrawerModel({this.status, this.code, this.message, this.data});

  DrawerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }


}

class Data {
  int id;
  String name;
  String icon;
  String link;

  Data({this.id, this.name, this.icon, this.link});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'];
    link = json['link'];
  }


}