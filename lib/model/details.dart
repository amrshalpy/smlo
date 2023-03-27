class DetailsModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  DetailsModel({this.data, 
  this.links, this.meta
  });

  DetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
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
  List<Videos>? videos;
  List<String>? storyimage;
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
      this.videos,
      this.endsAt,
      this.logo,
      this.address,
      this.storyimage,
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
    storyimage = json['story_images'].cast<String>();
    if (json['videos'] != null) {
      videos = <Videos>[];
      json['videos'].forEach((v) {
        videos!.add(new Videos.fromJson(v));
      });
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
    if (this.videos != null) {
      data['videos'] = this.videos!.map((v) => v.toJson()).toList();
    }
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
  

  Videos({this.file,});

  Videos.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    // duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['file'] = this.file;
    // data['duration'] = this.duration;
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

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first'] = this.first;
    data['last'] = this.last;
    data['prev'] = this.prev;
    data['next'] = this.next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<LinksX>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <LinksX>[];
      json['links'].forEach((v) {
        links!.add(new LinksX.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

  class LinksX {
  String? url;
  String? label;
  bool? active;

  LinksX({this.url, this.label, this.active});

  LinksX.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['url'] = this.url;
  //   data['label'] = this.label;
  //   data['active'] = this.active;
  //   return data;
  // }
}

