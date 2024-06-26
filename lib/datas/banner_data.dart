class BannerData {
  BannerData({
      this.data, 
      this.errorCode, 
      this.errorMsg,});

  BannerData.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(BannerDataItem.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }
  List<BannerDataItem>? data;
  num? errorCode;
  String? errorMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['errorCode'] = errorCode;
    map['errorMsg'] = errorMsg;
    return map;
  }

}

class BannerDataItem {
  BannerDataItem({
      this.desc, 
      this.id, 
      this.imagePath, 
      this.isVisible, 
      this.order, 
      this.title, 
      this.type, 
      this.url,});

  BannerDataItem.fromJson(dynamic json) {
    desc = json['desc'];
    id = json['id'];
    imagePath = json['imagePath'];
    isVisible = json['isVisible'];
    order = json['order'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }
  String? desc;
  num? id;
  String? imagePath;
  num? isVisible;
  num? order;
  String? title;
  num? type;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['desc'] = desc;
    map['id'] = id;
    map['imagePath'] = imagePath;
    map['isVisible'] = isVisible;
    map['order'] = order;
    map['title'] = title;
    map['type'] = type;
    map['url'] = url;
    return map;
  }

}