class SearchModel {
  bool status;
  int code;
  String message;
  List<Files> files;

  SearchModel({this.status, this.code, this.message, this.files});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['files'] != null) {
      files = <Files>[];
      json['files'].forEach((v) {
        files.add(new Files.fromJson(v));
      });
    }
  }


}

class Files {
  int id;
  String name;
  String fileLink;
  bool isNew;
  int titleId;
  int sectionId;
  int subSectionId;
  int subSubSectionId;
  int categoryId;
  String appLink;

  Files(
      {this.id,
        this.name,
        this.fileLink,
        this.isNew,
        this.titleId,
        this.sectionId,
        this.subSectionId,
        this.subSubSectionId,
        this.categoryId,
        this.appLink});

  Files.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fileLink = json['file_link'];
    isNew = json['isNew'];
    titleId = json['title_id'];
    sectionId = json['section_id'];
    subSectionId = json['sub_section_id'];
    subSubSectionId = json['sub_sub_section_id'];
    categoryId = json['category_id'];
    appLink = json['app_link'];
  }


}