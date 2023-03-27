class NewOffers {
  List<Data>? data;

  NewOffers({this.data});

  NewOffers.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? description;
  String? longDescription;
  String? discount;
  String? image;
  List<String>? images;
  // List<Videos>? videos;
  String? endsAt;
  String? logo;
  String? address;
  String? phone;
  String? whatsapp;
  bool? isTop;
  Category? category;
  String? categoryName;

  Data(
      {this.id,
      this.name,
      this.description,
      this.longDescription,
      this.discount,
      this.image,
      this.images,
      // this.videos,
      this.endsAt,
      this.logo,
      this.address,
      this.phone,
      this.whatsapp,
      this.isTop,
      this.category,
      this.categoryName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    longDescription = json['long_description'];
    discount = json['discount'];
    image = json['image'];
    images = json['images'].cast<String>();
    if (json['videos'] != null) {
      // videos = <Videos>[];
      // json['videos'].forEach((v) {
      //   videos!.add(new Videos.fromJson(v));
      // });
    }
    endsAt = json['ends_at'];
    logo = json['logo'];
    address = json['address'];
    phone = json['phone'];
    whatsapp = json['whatsapp'];
    isTop = json['is_top'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['long_description'] = this.longDescription;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['images'] = this.images;
    // if (this.videos != null) {
    //   data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    // }
    data['ends_at'] = this.endsAt;
    data['logo'] = this.logo;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['whatsapp'] = this.whatsapp;
    data['is_top'] = this.isTop;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['categoryName'] = this.categoryName;
    return data;
  }
}

class Videos {
  String? file;
  String? duration;

  Videos({this.file, this.duration});

  Videos.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    data['duration'] = this.duration;
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
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
