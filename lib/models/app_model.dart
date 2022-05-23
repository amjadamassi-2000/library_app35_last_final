class AppModel {
  bool status;
  int code;
  String message;
  App app;

  AppModel({this.status, this.code, this.message, this.app});

  AppModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    app = json['app'] != null ? new App.fromJson(json['app']) : null;
  }


}

class App {
  String logo;
  String filepageBanner;
  String filepageText;
  String filepageLink;
  String homepageBanner;
  String homepageText;
  String homepageLink;
  String appLink;

  App(
      {this.logo,
        this.filepageBanner,
        this.filepageText,
        this.filepageLink,
        this.homepageBanner,
        this.homepageText,
        this.homepageLink,
        this.appLink});

  App.fromJson(Map<String, dynamic> json) {
    logo = json['logo'];
    filepageBanner = json['filepage_banner'];
    filepageText = json['filepage_text'];
    filepageLink = json['filepage_link'];
    homepageBanner = json['homepage_banner'];
    homepageText = json['homepage_text'];
    homepageLink = json['homepage_link'];
    appLink = json['app_link'];
  }

}