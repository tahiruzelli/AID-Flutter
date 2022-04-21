class Advert {
  int? id;
  String? videoUrl;
  int? videoLength;
  int? totalGain;
  String? coverImageUrl;
  String? createTime;
  bool? isActive;

  Advert(
      {this.id,
      this.videoUrl,
      this.videoLength,
      this.totalGain,
      this.coverImageUrl,
      this.createTime,
      this.isActive});

  Advert.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoUrl = json['videoUrl'];
    videoLength = json['videoLength'];
    totalGain = json['totalGain'];
    coverImageUrl = json['coverImageUrl'];
    createTime = json['createTime'];
    isActive = json['isActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['videoUrl'] = videoUrl;
    data['videoLength'] = videoLength;
    data['totalGain'] = totalGain;
    data['coverImageUrl'] = coverImageUrl;
    data['createTime'] = createTime;
    data['isActive'] = isActive;
    return data;
  }
}
