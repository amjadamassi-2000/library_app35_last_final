class HomeModel  {
  bool status;
  int code;
  String message;
  List<Titles> titles;

  HomeModel ({this.status, this.code, this.message, this.titles});

  HomeModel .fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    if (json['titles'] != null) {
      titles =  List<Titles>();
      json['titles'].forEach((v) {
        titles.add( Titles.fromJson(v));
      });
    }
  }


}

class Titles {
  int id;
  String name;
  List<Section> section;
  List<SubSection> subSection;
  List<SubSubSection> subSubSection;

  Titles(
      {this.id, this.name, this.section, this.subSection, this.subSubSection});

  Titles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['section'] != null) {
      section =  List<Section>();
      json['section'].forEach((v) {
        section.add( Section.fromJson(v));
      });
    }
    if (json['sub_section'] != null) {
      subSection =  List<SubSection>();
      json['sub_section'].forEach((v) {
        subSection.add( SubSection.fromJson(v));
      });
    }
    if (json['sub_sub_section'] != null) {
      subSubSection =  List<SubSubSection>();
      json['sub_sub_section'].forEach((v) {
        subSubSection.add( SubSubSection.fromJson(v));
      });
    }
  }


}

class Section {
  int id;
  String name;

  Section({this.id, this.name});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }


}
class SubSection {
  int id;
  String name;

  SubSection({this.id, this.name});

  SubSection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }


}

class SubSubSection {
  int id;
  String name;

  SubSubSection({this.id, this.name});

  SubSubSection.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }


}