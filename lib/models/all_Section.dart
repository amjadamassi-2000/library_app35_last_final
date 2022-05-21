class AllSectionModel {
  bool status;
  int code;
  String message;
  List<Sections> sections;

  AllSectionModel({this.status, this.code, this.message, this.sections});

  AllSectionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections.add(new Sections.fromJson(v));
      });
    }
  }


}

class Sections {
  int id;
  String name;

  Sections({this.id, this.name});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}