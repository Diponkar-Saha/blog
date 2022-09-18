class BlogList {
  Data? data;
  String? message;
  int? status;

  BlogList({this.data, this.message, this.status});

  BlogList.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  Blogs? blogs;

  Data({this.blogs});

  Data.fromJson(Map<String, dynamic> json) {
    blogs = json['blogs'] != null ? new Blogs.fromJson(json['blogs']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (blogs != null) {
      data['blogs'] = blogs!.toJson();
    }
    return data;
  }
}

class Blogs {
  int? currentPage;
  List<Data1>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;

  String? path;
  int? perPage;

  int? to;
  int? total;

  Blogs(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,

        this.path,
        this.perPage,

        this.to,
        this.total});

  Blogs.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data1>[];
      json['data'].forEach((v) {
        data!.add(new Data1.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }

    data['path'] = this.path;
    data['per_page'] = this.perPage;

    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data1 {
  int? id;
  String? categoryId;
  String? title;
  String? subTitle;
  String? slug;
  String? description;

  String? date;
  String? status;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  Data1(
      {this.id,
        this.categoryId,
        this.title,
        this.subTitle,
        this.slug,
        this.description,

        this.date,
        this.status,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    subTitle = json['sub_title'];
    slug = json['slug'];
    description = json['description'];

    date = json['date'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['sub_title'] = this.subTitle;
    data['slug'] = this.slug;
    data['description'] = this.description;

    data['date'] = this.date;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}