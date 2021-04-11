class GetUserAccountModel {
  String key;
  String url;
  String name;
  String username;
  Pictures pictures;
  String biog;
  String city;
  String country;

  GetUserAccountModel(
      {this.key,
        this.url,
        this.name,
        this.username,
        this.pictures,
        this.city,
        this.country,
        this.biog,});

  GetUserAccountModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    url = json['url'];
    name = json['name'];
    username = json['username'];
    pictures = json['pictures'] != null
        ? new Pictures.fromJson(json['pictures'])
        : null;
    biog = json['biog'];
    city = json['city'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['url'] = this.url;
    data['name'] = this.name;
    data['username'] = this.username;
    if (this.pictures != null) {
      data['pictures'] = this.pictures.toJson();
    }
    data['biog'] = this.biog;
    data['city'] = this.city;
    data['country'] = this.country;
    return data;
  }
}

class Pictures {
  String small;
  String thumbnail;
  String mediumMobile;
  String medium;
  String large;
  String s320wx320h;
  String extraLarge;
  String s640wx640h;

  Pictures(
      {this.small,
        this.thumbnail,
        this.mediumMobile,
        this.medium,
        this.large,
        this.s320wx320h,
        this.extraLarge,
        this.s640wx640h});

  Pictures.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    thumbnail = json['thumbnail'];
    mediumMobile = json['medium_mobile'];
    medium = json['medium'];
    large = json['large'];
    s320wx320h = json['320wx320h'];
    extraLarge = json['extra_large'];
    s640wx640h = json['640wx640h'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['thumbnail'] = this.thumbnail;
    data['medium_mobile'] = this.mediumMobile;
    data['medium'] = this.medium;
    data['large'] = this.large;
    data['320wx320h'] = this.s320wx320h;
    data['extra_large'] = this.extraLarge;
    data['640wx640h'] = this.s640wx640h;
    return data;
  }
}
