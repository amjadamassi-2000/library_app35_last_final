class AdsModel {
  bool status;
  int code;
  String message;
  Ads ads;

  AdsModel({this.status, this.code, this.message, this.ads});

  AdsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    message = json['message'];
    ads = json['ads'] != null ? new Ads.fromJson(json['ads']) : null;
  }


}

class Ads {
  int id;
  String banner;
  String rewarded;
  String inter1;
  String inter2;
  String inter3;
  String inter4;
  int status;
  String createdAt;
  String updatedAt;

  Ads(
      {this.id,
        this.banner,
        this.rewarded,
        this.inter1,
        this.inter2,
        this.inter3,
        this.inter4,
        this.status,
        this.createdAt,
        this.updatedAt});

  Ads.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    banner = json['banner'];
    rewarded = json['rewarded'];
    inter1 = json['inter1'];
    inter2 = json['inter2'];
    inter3 = json['inter3'];
    inter4 = json['inter4'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}