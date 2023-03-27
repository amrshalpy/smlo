class Privacy {
  Data? data;

  Privacy({this.data});

  Privacy.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? privacyPolicy;
  String? about;

  Data({this.privacyPolicy, this.about});

  Data.fromJson(Map<String, dynamic> json) {
    privacyPolicy = json['privacy_policy'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['privacy_policy'] = this.privacyPolicy;
    data['about'] = this.about;
    return data;
  }
}